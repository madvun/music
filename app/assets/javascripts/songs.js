var ma = document.getElementById('player'),
    timer=1;
function show_timer(){
  if (timer==1) {display_time_ok(ma.currentTime);}
    else {display_time_back(ma.currentTime);}
}
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
function display_time_ok (time) {
  left=Math.floor(time/60)
  right=Math.floor(time-left*60)
  if (right<10) {right="0"+right}
  $('#s_t').text(left+':'+right);
}
function display_time_back (time) {
  left=Math.floor((ma.duration-time)/60)
  right=Math.floor((ma.duration-time)-(left*60))
  if (right<10) {right="0"+right}
  $('#s_t').text(left+':'+right);
}
$(document).ready(function(){
  $('#s_v').click(function(event){
    if (event.which!=1) return;
    d_lick(event,'s_v',80,18);
  })

  $('#s_l').click(function(event){
    if (event.which!=1) return;
    d_lick(event,'s_l',400,10);
  })
  $('#s_t').click(function(){
    if (timer==1) {timer=2}
    else {timer=1}
      show_timer()
  })  
});

window.setInterval(function(){
  if (ma.paused==false) {
    show_timer();
    $('#s_l_c').css('width',(ma.currentTime/ma.duration)*100+'%')
  }
}, 10);