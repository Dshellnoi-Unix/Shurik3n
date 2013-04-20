####
#  _________.__                 .__ __    ________         
# /   _____/|  |__  __ _________|__|  | __\_____  \  ____  
# \_____  \ |  |  \|  |  \_  __ \  |  |/ /  _(__  < /    \ 
# /        \|   Y  \  |  /|  | \/  |    <  /       \   |  \
#/_______  /|___|  /____/ |__|  |__|__|_ \/______  /___|  /
#        \/      \/                     \/       \/     \/ 
#
#                    Dshellnoi Unix  2013
#                      
#   CLASE      :        DICC::WP::WPbugs                                                             
#   CREADO POR   :      Dshellnoi Unix   
#   CORREO       :      templesec0day@gmail.com                    
#   FECHA:              13-4-2013                             
#   ACTUALIZACION:      
#   VERSION      :      0.1                            
#                                                                
#   LICENCIA:                                                 
#            SUJETO A LA LICENCIA SHURIK3N            
####

use vars qw($VERSION @ISA @bugs);
@ISA = qw(); 
$VERSION = '0.01';


@bugs = (

{

tit          => 'Comment Rating SQL injection',
version      => '2.9.32',
adv          => 'http://1337day.com/exploit/20446',
payload      => 'wp-content/plugins/comment-rating/ck-processkarma.php',
vuln         => 'SQLI'
},

{

tit          => 'Catalog Plugin Xss',
version      => '1.4.1',
adv          => 'http://cxsecurity.com/issue/WLB-2013040094',
payload      => 'wp-content/plugins/catalog/spiderBox/spiderBox.js.php',
vuln         => 'XSS'
},

{

tit          => 'Plugin wp-video-commando XSS',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20576',
payload      => 'wp-content/plugins/wp-video-commando/magic-code1.php',
vuln         => 'XSS'
},

{

tit          => 'plugin CKEditor 4.0 Arbitrary File Upload Exploit',
version      => '4.0',
adv          => 'http://1337day.com/exploit/20318',
payload      => 'wp-content/plugins/ckeditor-for-wordpress/includes/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'bp-gallery plugin v1.2.5',
version      => '1.2.5',
adv          => 'http://1337day.com/exploit/20518',
payload      => 'wp-content/plugins/bp-gallery/inc/js/swfupload/swfupload.swf',
vuln         => 'XSS'
},

{

tit          => 'WP-e-Commerce plugin v3.8.9.5 Cross Site Scripting',
version      => '3.8.9.5',
adv          => 'http://1337day.com/exploit/20517',
payload      => 'wp-content/plugins/wp-e-commerce/wpsc-core/js/swfupload.swf',
vuln         => 'XSS'
},

{

tit          => 'dynamic-font-replacement-4wp Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20299',
payload      => 'wp-content/plugins/dynamic-font-replacement-4wp/admin/upload2.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'powerzoomer Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20253',
payload      => 'wp-content/plugins/power-zoomer/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'RLSWordPressSearch plugin SQLI',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20265',
payload      => 'wp-content/plugins/RLSWordPressSearch/register.php',
vuln         => 'SQLI'
},

{

tit          => 'SWFUpload (Object Injection/CSRF) Vulnerabilities payload[1]',
version      => 'ALL',
adv          => 'http://packetstormsecurity.com/files/121348/SWFUpload-CSRF-XSS-Object-Injection.html',
payload      => 'wp-includes/plugins/bp-gallery/inc/js/swfupload/swfupload.swf',
vuln         => 'XSRF|XSS'
},

{

tit          => 'SWFUpload (Object Injection/CSRF) Vulnerabilities payload[2]',
version      => 'ALL',
adv          => 'http://packetstormsecurity.com/files/121348/SWFUpload-CSRF-XSS-Object-Injection.html',
payload      => 'wp-includes/js/swfupload/swfupload.swf',
vuln         => 'XSRF|XSS'
},

{

tit          => 'Google Alert And Twitter WP Plugin v. 3.1.5 XSS Exploit & SQL Injection',
version      => '3.1.5',
adv          => 'http://1337day.com/exploit/20433',
payload      => 'wp-content/plugins/googlealertandtwitter/activation.php',
vuln         => 'XSS|SQLI'
},

{

tit          => 'plugins ForumConverter SQLI',
version      => '1.11',
adv          => 'http://1337day.com/exploit/20275',
payload      => 'wp-content/plugins/forumconverter/fc-sig-req.php',
vuln         => 'SQLI'
},

{

tit          => 'p1m media manager plugin SQLI',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20270',
payload      => 'wp-content/plugins/p1m-media-manager/player.php',
vuln         => 'SQLI'
},

{

tit          => 'yvora Full Path Disclosure',
version      => 'N/A',
adv          => 'N/A',
payload      => 'wp-content/themes/yvora/index.php',
vuln         => 'FPD'
},

{

tit          => 'grou-random-image-widget Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20047',
payload      => 'wp-content/plugins/grou-random-image-widget/g-random-img.php',
vuln         => 'FPD'
},


{

tit          => 'shotzz Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20041',
payload      => 'wp-content/themes/shotzz/',
vuln         => 'FPD'
},

{

tit          => 'vithy Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20040',
payload      => 'wp-content/themes/vithy/index.php',
vuln         => 'FPD'
},


{

tit          => 'appius Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20039',
payload      => 'wp-content/themes/appius/index.php',
vuln         => 'FPD'
},

{

tit          => 'theme sandbox Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20228',
payload      => 'wp-content/themes/sandbox/js/uploadify/uploadify.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},


{

tit          => 'Image News slider plugin v3.5 Cross Site Scripting',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20560',
payload      => 'wp-content/themes/felici/sprites/js/uploadify/uploadify.swf',
vuln         => 'XSS'
},

{

tit          => 'o2s-gallery plugin Cross Site Scripting',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20516',
payload      => 'wp-content/plugins/o2s-gallery/js/SWFUpload/Flash/swfupload.swf',
vuln         => 'XSS'
},

{

tit          => 'RLSWordPressSearch plugin SQL Injection',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20265',
payload      => 'wp-content/plugins/RLSWordPressSearch/register.php',
vuln         => 'SQLI'
},

{

tit          => 'wp-homepage-slideshow Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20260',
payload      => 'wp-content/plugins/wp-homepage-slideshow/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},


{

tit          => 'wp-image-news-slider Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20259',
payload      => 'wp-content/plugins/wp-image-news-slider/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'wp-catpro Arbitrary File Upload Vulnerability',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20256',
payload      => 'wp-content/plugins/wp-catpro/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'wp-3dflick-slideshow Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20255',
payload      => 'wp-content/plugins/wp-3dflick-slideshow/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'accordion Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20254',
payload      => 'wp-content/plugins/accordion/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'wp-powerplaygallery Arbitrary File Upload',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20252',
payload      => 'wp-content/plugins/wp-powerplaygallery/js/swfupload/js/upload.php',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'Themes moneymasters Full Path Disclosure ',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20077',
payload      => 'wp-content/themes/moneymasters/index.php',
vuln         => 'FPD'
},

{

tit          => 'plugins kioskprox XSS',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20624',
payload      => 'wp-content/plugins/kioskprox/app/mail/index.php',
vuln         => 'XSS'
},

{

tit          => 'plugins timelineoptinpro XSS',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20620',
payload      => 'wp-content/plugins/timelineoptinpro/timeline/index.php',
vuln         => 'XSS'
},

{

tit          => 'Chocolate WP Theme Multiple',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20216',
payload      => 'wp-content/themes/dt-chocolate/thumb.php',
vuln         => 'MULTIPLE'
},

{

tit          => 'Flash News theme Multiple',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20280',
payload      => 'wp-content/themes/flashnews/thumb.php',
vuln         => 'MULTIPLE'
},

{

tit          => 'vote-it-up plugin Full Path Disclosure',
version      => 'wp-image-news-slider/A',
adv          => 'http://1337day.com/exploit/20161',
payload      => 'wp-content/plugins/vote-it-up/voteitup.php',
vuln         => 'FPD'
},

{

tit          => 'wp-polls plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20159',
payload      => 'wp-content/plugins/wp-polls/polls-templates.php',
vuln         => 'FPD'
},

{

tit          => 'ultimate-security-check plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20152',
payload      => 'wp-content/plugins/ultimate-security-check/wp-ultimate-security.php',
vuln         => 'FPD'
},

{

tit          => 'dynamic-headers plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20151',
payload      => 'wp-content/plugins/dynamic-headers/custom-header.php',
vuln         => 'FPD'
},

{

tit          => 'plugins - ipfeuilledechou SQL Injection Vulnerability ',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20206',
payload      => 'wp-content/plugins/ipfeuilledechou/pdf.php',
vuln         => 'SQLI'
},

{

tit          => 'plugin Ripe HD FLV Player SQL Injection',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20199',
payload      => 'wp-content/plugins/ripe-hd-player/config.php',
vuln         => 'SQLI'
},

{

tit          => 'sem WYSIWYG Arbitrary File Upload Vulnerability',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20233',
payload      => 'wp-content/plugins/sem-wysiwyg/fckeditor/editor/filemanager/connectors/test.html',
vuln         => 'ARBITRARY FILE UPLOAD'
},

{

tit          => 'haiku-minimalist-audio-player plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20150',
payload      => 'wp-content/plugins/haiku-minimalist-audio-player/haiku-player.php',
vuln         => 'FPD'
},

{

tit          => 'wp-events plugin Full Path Disclosure vulnerability',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20133',
payload      => 'wp-content/plugins/wp-events/wp-events.php',
vuln         => 'FPD'
},

{

tit          => 'wp-super-cache plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20128',
payload      => 'wp-content/plugins/wp-super-cache/wp-cache.php',
vuln         => 'FPD'
},

{

tit          => 'admin-menu-editor plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20127',
payload      => 'wp-content/plugins/admin-menu-editor/menu-editor.php',
vuln         => 'FPD'
},

{

tit          => 'multibox plugin Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20119',
payload      => 'wp-content/plugins/wordpress-multibox-plugin/multibox.php',
vuln         => 'FPD'
},

{

tit          => 'plugin superslider-show Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20117',
payload      => 'wp-content/plugins/superslider-show/superslider-show.php',
vuln         => 'FPD'
},

{

tit          => 'sitepress-multilingual-cms Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20067',
payload      => 'wp-content/plugins/sitepress-multilingual-cms/sitepress.php',
vuln         => 'FPD'
},

{

tit          => 'massimo theme Full Path Disclosure vulnerability',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20202',
payload      => 'wp-content/themes/massimo/sp-framework/sp-wp-login.php',
vuln         => 'FPD'
},

{

tit          => 'eggo theme Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20201',
payload      => 'wp-content/themes/eggo/sp-framework/sp-wp-login.php',
vuln         => 'FPD'
},

{

tit          => 'striking theme Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20168',
payload      => 'wp-content/themes/striking/index.php',
vuln         => 'FPD'
},

{

tit          => 'slash theme Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20167',
payload      => 'wp-content/themes/slash/index.php',
vuln         => 'FPD'
},

{

tit          => 'display theme Full Path Disclosure',
version      => 'N/A',
adv          => 'http://1337day.com/exploit/20166',
payload      => 'wp-content/themes/display/framework/includes/timthumb.php?src=/wp-content/uploads/',
vuln         => 'FPD'
},

{

tit          => 'Sahifa theme 2.4.0 CSRF / FULL PATH DISCLOSURE',
version      => '2.4.0 ',
adv          => 'http://1337day.com/exploit/20097',
payload      => 'wp-content/themes/sahifa/category.php',
vuln         => 'FPD'
}


);


1;

