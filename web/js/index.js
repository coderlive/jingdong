window.onload=()=>{
    let imglist = ['https://img30.360buyimg.com/da/s1180x940_jfs/t1/136138/12/7456/101075/5f3cfc51E7a67d364/bb6ee2b4e97114f5.jpg.webp',
               'https://img10.360buyimg.com/pop/s1180x940_jfs/t1/117560/33/14763/86012/5f351850E7f74417f/0ef87bcc20d3051d.jpg.webp',
               'https://img13.360buyimg.com/pop/s1180x940_jfs/t1/149655/13/5107/72838/5f30c942E5b072378/7d6f13675462b613.jpg.webp',
               'https://imgcps.jd.com/ling4/4657814/5ZSk6YaS5aSP5a2j/56We56eY5paw5Y-j5ZGz/p-5bd8253082acdd181d02f9d3/488f1e2c/cr/s/q.jpg',
               'https://img11.360buyimg.com/pop/s1180x940_jfs/t1/145663/22/6185/87065/5f409337E92a4ec2b/8280c54f14eebad8.jpg.webp',
               'https://imgcps.jd.com/ling4/100004003738/5a6F5a625b-F5aSH/5ZOB6LSo55Sf5rS7/p-5bd8253082acdd181d02fa40/bf6de94a/cr/s/q.jpg',
               'https://img10.360buyimg.com/pop/s1180x940_jfs/t1/148313/40/5826/90729/5f3ce57aEe1dd28f5/ae446211dc7dec80.jpg.webp',
               'https://img10.360buyimg.com/pop/s1180x940_jfs/t1/133196/39/6777/87908/5f324a76E9199bae1/6d1469a36aa7549d.jpg.webp'];
    let menu_img_list = [
        ['https://img14.360buyimg.com/babel/s380x300_jfs/t1/138352/25/6195/74907/5f3f688fEcf10f193/1bb1b7d78eb1cf84.jpg.webp',
        'https://img12.360buyimg.com/babel/s380x300_jfs/t1/126775/2/10241/64864/5f3f72abEd71b42f2/5dc93a3d34df2204.jpg.webp',
        'https://img11.360buyimg.com/babel/s380x300_jfs/t1/127974/15/10014/81883/5f3b66e1E7390c411/d77c8f91f67a13db.jpg.webp'],
         [
        'https://img13.360buyimg.com/babel/s380x300_jfs/t1/139604/34/6080/71174/5f3f7c63Eb1d6e543/554ade4692e0ca6d.jpg.webp',
        'https://img14.360buyimg.com/babel/s380x300_jfs/t1/126685/39/10141/71167/5f3f32c8E6e4d2c1f/c2faa551a0c501f3.jpg.webp',
        'https://img10.360buyimg.com/babel/s380x300_jfs/t1/143456/3/4716/58748/5f2b998fE7e9e93f6/e8f4765656bc56dd.jpg.webp'
        ],
         ['https://img11.360buyimg.com/babel/s380x300_jfs/t1/139808/3/5975/65954/5f3faedaE0b786631/56586c4b6d00b205.jpg.webp',
        'https://img30.360buyimg.com/babel/s380x300_jfs/t1/116278/23/15365/77162/5f3f7ba9Eeac1dfe5/2ec7ee801f612007.jpg.webp',
        'https://img30.360buyimg.com/pop/s380x300_jfs/t1/118160/33/15295/76741/5f3cd808E9309d43a/ecdd54e75e951dda.png.webp']
        ];
    let index=0;
    let banner=document.getElementById('banner');
    let up_img=document.getElementById('up_img');
    let next_img=document.getElementById('next_img');
    let list_hover_a=document.querySelectorAll('#hover_a>a');
    let up_menu=document.getElementById('up_menu');//选择上一个banner菜单
    let down_menu=document.getElementById('down_menu');//选择下一个banner菜单
    let menu_list=document.querySelectorAll('.flex_div>.img');
    let banner_menu=document.getElementById('banner_menu');
    let menu_index=0;
    let time=0;
    let menu_time=0;
    //网页加载完后开启轮播图
    time=start();
    menu_time=startmenu();
    banner.addEventListener('mouseenter',()=>{
        //鼠标进入的时候停止事件
        stop(time)
    })
    banner.addEventListener('mouseleave',()=>{
        time=start();
    })
    //加载上一页下一页事件
    up_img.onclick=()=>{
        index--;
        index=index<0?imglist.length-1:index;
        banner.style.background='url('+imglist[index]+')';
        banner.style.backgroundSize='100% 100%';  
    }
    next_img.onclick=()=>{
        index++;
        index=index==imglist.length?0:index;
        banner.style.background='url('+imglist[index]+')';
        banner.style.backgroundSize='100% 100%';  
    }
    //加载移动事件
    list_hover_a.forEach((a)=>{
        a.onmouseover=function()
        {
            index=this.getAttribute('hover');
            banner.style.background='url('+imglist[index]+')';
            banner.style.backgroundSize='100% 100%';  
        }
    });

    //查看下一个menu按钮
    down_menu.onclick=function()
    {
        //menu_index表示菜单的索引，menu_list表示html的imgdiv的dom元素,list表示取出所有图片链接的索引的图片
        menu_index++;
        menu_index=menu_index==menu_list.length?0:menu_index;
        let list=menu_img_list[menu_index];//代表下表为munu_index的哪一个bannermenu
        for(let i=0;i<menu_list.length;i++)
        {
            menu_list[i].style.background='url('+list[i]+')';
            menu_list[i].style.backgroundSize='100% 100%'; 
        }
    }
    //查看上一个menu按钮
    up_menu.onclick=function()
    {
        //menu_index表示菜单的索引，menu_list表示html的imgdiv的dom元素,list表示取出所有图片链接的索引的图片
        menu_index--;
        menu_index=menu_index<0?menu_list.length-1:menu_index;
        let list=menu_img_list[menu_index];//代表下表为munu_index的哪一个bannermenu
        for(let i=0;i<menu_list.length;i++)
        {
            menu_list[i].style.background='url('+list[i]+')';
            menu_list[i].style.backgroundSize='100% 100%'; 
        }
    }
    //下面写menu的轮播效果
    banner_menu.addEventListener('mouseover',()=>{
        stop(menu_time);//当鼠标滑过的时候停止
    })
    banner_menu.addEventListener('mouseout',()=>{
        menu_time=startmenu();//当鼠标离开的时候重新开始
    })
    function startmenu()//开启轮播图
    {
        return setInterval(()=>{
            menu_index++;
            menu_index=menu_index==menu_list.length?0:menu_index;
            let list=menu_img_list[menu_index];//代表下表为munu_index的哪一个bannermenu
            console.log(menu_index);
            for(let i=0;i<menu_list.length;i++)
            {
                menu_list[i].style.background='url('+list[i]+')';
                menu_list[i].style.backgroundSize='100% 100%'; 
            }
        },8000)
    }
    function stop(time)//关闭轮播图
    {
        clearInterval(time);
    }

    function start()//开启轮播图
    {
        return setInterval(()=>{
            index++;
            index=index==imglist.length?0:index;
            banner.style.background='url('+imglist[index]+')';
            banner.style.backgroundSize='100% 100%';  
        },3000)
    }
    function stop(time)//关闭轮播图
    {
        clearInterval(time);
    }
}