$(function (){

    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }

    function preview(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').addClass('uploaded');
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
                //當檔案大於 1mb即顯示檔案過大

                var btn_submit = $('#account-update:input[type=submit]');
                if ( KB >= 1000) { 
                    $('.upload-state').addClass('too-big');
                    btn_submit.addClass('disabled');
                    btn_submit.click(function() { 
                        console.log("防止動作");
                        event.preventDefault();
                    });
                } else {
                    $('.upload-state').removeClass('too-big');
                    btn_submit.toggleClass('disabled');
                    btn_submit.unbind( "click" );
                }
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("body").on("change", ".file", function (){
        preview(this);
    })
    
})