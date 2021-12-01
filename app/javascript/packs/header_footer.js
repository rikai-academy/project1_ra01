
document.addEventListener("turbolinks:load", function() {
  $($(".dropbtn-menu")).click(function(){
    document.getElementById("myDropdown").classList.toggle("show");
  })
  var dropBtn = document.getElementsByClassName("dropbtn");
  var myDropdown = document.getElementsByClassName("list");
  console.log(myDropdown);
  var a = document.getElementById("myDropdown1");
  for(let i = 1;i<dropBtn.length;i++){
        dropBtn[i].addEventListener("click",function (e) {
            for (let j = i-1; j < myDropdown.length; j++){
              const element = myDropdown[j];
              console.log(element);
              console.log("ok");
              if(element == myDropdown[0]) {
                element.classList.toggle("show1");
              } else {
                element.classList.toggle("show2");
              }
              break;
            }
          }

      )
  }

  function myFunction1() {
    document.getElementById("myDropdown1").classList.toggle("show1");
  }

  function myFunction2() {
    document.getElementById("myDropdown2").classList.toggle("show2");
  }

  function openmenu() {
    document.getElementById("menu-mobile").classList.toggle("Open");
  }

  (() =>{
    let tagmenu = document.querySelector(".tabMenu");
    let content = document.querySelector(".content");
    let contentitems = document.querySelectorAll(".content-item");
    console.log(contentitems);
    console.log(tagmenu);
    tagmenu.addEventListener("click", (event)=>{
      if(event.target.classList.contains("tag-menu") &&
        !event.target.classList.contains("active")) {
        tagmenu.querySelector(".active").classList.remove("active");
        event.target.classList.add("active")
        const target = event.target.getAttribute("data-target");
        console.log(target);
        contentitems.forEach((item) => {
        if(target === item.getAttribute("data-category")) {
          item.classList.remove("hide");
          item.classList.add("show");
        }
        else {
          item.classList.remove("show");
          item.classList.add("hide");
        }
        });

        }

    });

  })();


  $(document).ready(function() {
    $('#autoWidth').lightSlider({
        autoWidth:true,
        loop:true,
        onSliderLoad: function() {
            $('#autoWidth').removeClass('cS-hidden');
        }
    });
  });
})
