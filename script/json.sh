# 获取index.json配置数据

getFliePath(){
    local data=''
    local json=$1
    local path=${json//index\.json/}
    
    arr=(moc png mtn json)
    for name in ${arr[*]};do
        data="$data \n$(sed -n '/\.'$name'/p' $json)"
    done


    data="$(echo -e "$data")"
    data="${data//\"/}"
    data="${data//\{/}"
    data="${data//\}/}"
    data="${data//\:/\\n}"
    data="${data//\,/\\n}"
    data="${data//motions\/\.\.\//}"
    data="${data//expressions\/\.\.\//}"
    data=${data//h\ D/h*D}
    

    local jsonData=$(echo -e "$data")
    data=''
    for name in ${arr[*]};do
        data="$data \n$(echo "$jsonData"|sed -n '/\.'$name'/p')"
    done
    
   
    
    for name in $(echo -e "$data"|sort|uniq);do
        name="$path$name" 
        name=${name//\/\//\/}
        if ! test -e $name; then
            echo "文件不存在: $name"
        else
            json="$json\n$name"
        fi
        
    done
    
    echo -e "$json"


}











getIndexData(){
    
    jsonPath=$(find ./model -name "index.json"|sort|uniq)

    for paths in $(echo -e "$jsonPath");do
        getFliePath $paths
        echo 'END'
        # getFliePath $paths >> ./data.json
        # echo 'END' >> ./data.json
        
    done



}



getIndexData




















