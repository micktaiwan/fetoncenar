document.observe("dom:loaded", function(){
  contents = $('script').select('div.accordion-content');
  for(var i=0; i< contents.length; i++){
      contents[i].hide();
      }
  })

function my_expand(el, c) {
  c.show();
  //accordion.expand(el);
  h = c.clientHeight+"px";
  c.setStyle({height: h})
  //alert(c.clientHeight);
  //alert('ok');
  }

