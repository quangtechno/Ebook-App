
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>

<script>
	var bookArr = [ {
		name : "Lập trình C++ dành cho người mới học",
		author : "Đỗ Thị Hồng Ngát",
		image : "image/1.png",
		category:"recent",
	}, {
		name : "An Toàn Thông Tin",
		author : "TS. Lê Văn Phùng",
		image : "image/2.png",
		category:"recent",
	}, {
		name : "Những ý tưởng khoa học công nghệ thời đại 4.0",
		author : "Nhiều Tác Giả",
		image : "image/3.png",
		category:"recent",
	},
	{
		name : "Quốc Sử Di Biên",
		author : "Nhà nghiên cứu. Phan Thúc Trực",
		image : "image/4.png",
		category:"new",
	},
	{
		name : "Muôn Kiếp Nhân Sinh 3",
		author : "Nguyên Phong",
		image : "image/5.png",
		category:"new",
	},
	{
		name : "Teamwork 101-làm việc nhóm 101",
		author : "John Maxwell",
		image : "image/6.png",
		category:"new",
	},
	{
		name : "Teamwork 101-làm việc nhóm 101",
		author : "John Maxwell",
		image : "image/6.png",
		category:"new",
	},{
		name : "Teamwork 101-làm việc nhóm 101",
		author : "John Maxwell",
		image : "image/6.png",
	},
	];
	document.addEventListener("DOMContentLoaded", function() {
		bookArr.forEach(function addBook(book) {
			var main = document.getElementById("Recent");
			var temp = document.createElement("div");
			temp.classList.add("card", "m-3","text-center","justify-content-center","align-items-center");
			temp.style.width = "18rem";
			var image = document.createElement("img");
			image.classList.add("presentImage");
			image.src = book.image;
			image.classList.add("card-img-top");
			var subtemp = document.createElement("div");
			subtemp.classList.add("card-body");
			var title = document.createElement("h5");
			title.classList.add("card-title");
			title.textContent = book.name;
			var param = document.createElement("p");
			param.classList.add("card-text");
			param.textContent = book.author;
			var choice = document.createElement("div");
			choice.classList.add("row","justify-content-center");
			var add = document.createElement("a");
			add.classList.add("btn", "btn-success", "btn-sm", "ml-1");
			add.innerText = "Add Card";
			var view = document.createElement("a");
			view.classList.add("btn", "btn-primary", "btn-sm", "ml-1");
			view.innerText = "View Details";
			choice.appendChild(add);
			choice.appendChild(view);
			subtemp.appendChild(title);
			subtemp.appendChild(param);
			subtemp.appendChild(choice);
			temp.appendChild(image);
			temp.appendChild(subtemp);

			main.appendChild(temp);
		});
		bookArr.forEach(function addBook(book) {
			var main = document.getElementById("New");
			var temp = document.createElement("div");
			temp.classList.add("card", "m-3","text-center","justify-content-center","align-items-center");
			temp.style.width = "18rem";
			var image = document.createElement("img");
			image.classList.add("presentImage");
			image.src = book.image;
			image.classList.add("card-img-top");
			var subtemp = document.createElement("div");
			subtemp.classList.add("card-body");
			var title = document.createElement("h5");
			title.classList.add("card-title");
			title.textContent = book.name;
			var param = document.createElement("p");
			param.classList.add("card-text");
			param.textContent = book.author;
			var choice = document.createElement("div");
			choice.classList.add("row",	"justify-content-center");
			var add = document.createElement("a");
			add.classList.add("btn", "btn-success", "btn-sm", "ml-1");
			add.innerText = "Add Card";
			var view = document.createElement("a");
			view.classList.add("btn", "btn-primary", "btn-sm", "ml-1");
			view.innerText = "View Details";
			choice.appendChild(add);
			choice.appendChild(view);
			subtemp.appendChild(title);
			subtemp.appendChild(param);
			subtemp.appendChild(choice);
			temp.appendChild(image);
			temp.appendChild(subtemp);

			main.appendChild(temp);
		});
	});
</script>
