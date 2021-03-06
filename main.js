(function(){

	let loadExternal = [];


	// 配置资源
	const config = [
		'./css/waifu.css',
		'./css/font-awesome.css',
		'./data/model.js',
		'./data/text.js',
		'./2D/Live2D.js',
		'./js/template.js',
		'./js/init2D.js'
	];



	config.forEach((paths)=>{
		format = paths.split('.')[2];
		loadExternal.push(loadExternalResource(paths,format))	
	})


	
	
	// 加载资源
	if (screen.width >= 768) {
		Promise.all(loadExternal).then(() => {
			initWidget();
		});
	}
	
	
	
	
	
	// 封装异步加载资源的方法
	function loadExternalResource(url, type) {
		return new Promise((resolve, reject) => {
			let tag;

			if (type === "css") {
				tag = document.createElement("link");
				tag.rel = "stylesheet";
				tag.href = url;
			}
			else if (type === "js") {
				tag = document.createElement("script");
				tag.src = url;
			}
			if (tag) {
				tag.onload = () => resolve(url);
				tag.onerror = () => reject(url);
				document.head.appendChild(tag);
			}
		});
	}



})()

















