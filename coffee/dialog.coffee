class Dialog

  template:  """
             <div class="x-launcher" style="display: none">
               <div class="x-launcher-item" data-bookmarklet="javascript:(function(){window.twttr=window.twttr||{};var%20D=550,A=450,C=screen.height,B=screen.width,H=Math.round((B/2)-(D/2)),G=0,F=document,E;if(C>A){G=Math.round((C/2)-(A/2))}window.twttr.shareWin=window.open('http://twitter.com/share','','left='+H+',top='+G+',width='+D+',height='+A+',personalbar=0,toolbar=0,scrollbars=1,resizable=1');E=F.createElement('script');E.src='http://platform.twitter.com/bookmarklets/share.js?v=1';F.getElementsByTagName('head')[0].appendChild(E)}());">
                 <i class="fa fa-twitter-square"></i>
                 <span class="x-launcher-item-title">tweet</span>
               </div>

               <div class="x-launcher-item" data-bookmarklet="javascript:var%20d=document,f='https://www.facebook.com/share',l=d.location,e=encodeURIComponent,p='.php?src=bm&v=4&i=1385800408&u='+e(l.href)+'&t='+e(d.title);1;try{if%20(!/^(.*\.)?facebook\.[^.]*$/.test(l.host))throw(0);share_internal_bookmarklet(p)}catch(z)%20{a=function()%20{if%20(!window.open(f+'r'+p,'sharer','toolbar=0,status=0,resizable=1,width=626,height=436'))l.href=f+p};if%20(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else{a()}}void(0)">
               <i class="fa fa-facebook-square"></i>
               <span class="x-launcher-item-title">share</span>
               </div>

               <div class="x-launcher-item" data-bookmarklet="javascript:var%20d=document,w=window,e=w.getSelection,k=d.getSelection,x=d.selection,s=(e?e():(k)?k():(x?x.createRange().text:0)),f='http://www.tumblr.com/share',l=d.location,e=encodeURIComponent,p='?v=3&u='+e(l.href)%20+'&t='+e(d.title)%20+'&s='+e(s),u=f+p;try{if(!/^(.*\.)?tumblr[^.]*$/.test(l.host))throw(0);tstbklt();}catch(z){a%20=function(){if(!w.open(u,'t','toolbar=0,resizable=0,status=1,width=450,height=430'))l.href=u;};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();}void(0)">
               <i class="fa fa-tumblr-square"></i>
               <span class="x-launcher-item-title">tumblr</span>
               </div>

               <div class="x-launcher-item" data-bookmarklet="javascript:(function()%20%7B%20var%20s%20=%20document.createElement(%22script%22);%20s.setAttribute(%22id%22,%20%22bitmark_js%22);%20s.setAttribute(%22type%22,%20%22text/javascript%22);%20s.setAttribute(%22src%22,%20%22//bitly.com/a/bitmarklet.js%22);%20(top.document.body%20%7C%7C%20top.document.getElementsByTagName(%22head%22)[0]).appendChild(s);%20%7D)();">
               <i class="fa fa-link"></i>
               <span class="x-launcher-item-title">bit.ly</span>
               </div>

               <div class="x-launcher-item" data-bookmarklet="javascript:(%28function%28%29%7Bwindow.baseUrl%3D%27http%3A//www.readability.com%27%3Bwindow.readabilityToken%3D%27T5GatEkGgAhXq2PE3dNeG8ZWvf3z7hwnXnZzdL26%27%3Bvar%20s%3Ddocument.createElement%28%27script%27%29%3Bs.setAttribute%28%27type%27%2C%27text/javascript%27%29%3Bs.setAttribute%28%27charset%27%2C%27UTF-8%27%29%3Bs.setAttribute%28%27src%27%2CbaseUrl%2B%27/bookmarklet/save.js%27%29%3Bdocument.documentElement.appendChild%28s%29%3B%7D%29%28%29)">
               <i class="fa fa-inbox"></i>
               <span class="x-launcher-item-title">readability</span>
               </div>

               <div class="x-launcher-item" data-bookmarklet="http://www.youtube.com/watch?v=JQpxpqCv8Gc">
               <i class="fa fa-minus-circle"></i>
               <span class="x-launcher-item-title">unko</span>
               </div>
             </div>
             """
  shown: false

  constructor: ->
    $('body').append this.template
    $('.x-launcher .x-launcher-item').click (event)=> this.on_menu_click(event)

  show: ->
    $('.x-launcher').show()
    this.shown = true

  hide: ->
    $('.x-launcher').hide()
    this.shown = false

  is_shown: =>
    this.shown

  on_menu_click: (event)->
    this.execute_bookmarklet(event.currentTarget)

  execute_bookmarklet: (item)->
    bookmarklet = item.dataset.bookmarklet
    document.location = bookmarklet

$ ->
  dialog = new Dialog

  keypress.combo "control l", =>
    if dialog.is_shown()
      dialog.hide()
    else
      dialog.show()


