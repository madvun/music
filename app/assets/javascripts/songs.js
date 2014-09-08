var ma = document.getElementById('player');
function d_lick(e,id_o,length,margin) {
  if (e.which!=1) return;
  var posX = $('#'+id_o).position().left+margin,
      widX= ((e.pageX-posX)/length)*100;
  if (widX<0) { widX=0; $('#'+id_o+'_e')}
  else if (widX>100) {widX=100;}
  $('#'+id_o+'_c').css('width',widX+'%')
  if (id_o=='s_l') {ma.currentTime=(ma.duration*widX)/100}
  if (id_o=='s_v') {ma.volume=widX/100}
}
function display_time (time) {
  left=Math.floor(time/60)
  right=time-left*60
  $('#s_t').text(left+':'+Math.floor(right));
}
$(document).ready(function(){
  $('#s_v').click(function(event){
    console.log("WORK")
    if (event.which!=1) return;
    d_lick(event,'s_v',80,18);
  })

  $('#s_l').click(function(event){
    console.log("WORK")
    if (event.which!=1) return;
    d_lick(event,'s_l',400,10);
  })
});

window.setInterval(function(){
  if (ma.paused==false) {display_time(ma.currentTime);$('#s_l_c').css('width',(ma.currentTime/ma.duration)*100+'%')}
}, 10);