    $("#contact-form").submit(function(event) {
        var attrs =  $("#contact-form").attr('action'); 
        // console.info(attrs);
        event.preventDefault();
        var msg = "";
        if (!$("input[name=nickname]").val()) {
            msg += "请输入您的姓名" + "<br/>"
        } else {
            if (!$("input[name=nickname]").val().match(/^.{1,10}$/)) {
                msg += "姓名不能超过10个字符" + "<br/>"
            }
        }
        if (!$("input[name=contact]").val()) {
            msg += "请输入您的联系方式" + "<br/>"
        } else {
            if (!$("input[name=contact]").val().match(/^.{1,50}$/)) {
                msg += "联系方式不能超过50个字符" + "<br/>"
            }
        }
        if (!$("textarea[name=content]").val()) {
            msg += "请输入您的需求或者建议" + "<br/>"
        } else {
            if (!$("textarea[name=content]").val().match(/^.{1,150}$/)) {
                msg += "需求或者建议不能超过150个字符" + "<br/>"
            }
        }
        if (msg) {
            showMessage(msg, "error")
        } else {
            $.post(attrs, {
                "nickname": $("input[name=nickname]").val(),
                "contact": $("input[name=contact]").val(),
                "content": $("textarea[name=content]").val()
            },
            function(data) {
                // alert(11);
                // console.info(data);
                if (data.code>0) {
                    showMessage(data.msg);
                    $("#contact-form")[0].reset()
                } else {
                    showMessage(data.msg, "error") 
                }
            },'json')
        }
        return false
    });
    function msgbox(tit, msg) {
        $(".cover .msg h4").text(tit);
        $(".cover .msg p").text(msg);
        $(".cover").show()
    }
    function showMessage(msg, type, tit) {
        if (type == "error") {
            layer.open({
                title: [tit || "出错啦", "background-color: #f00; color: #fff;"],
                content: msg,
                style: "background-color: #fff; color: #666; min-width: 50%;",
                btn: ["确定"]
            })
        } else {
            if (type == "info") {
                layer.open({
                    title: [tit || "提示", "background-color: #f6f6f6; color: #666;"],
                    content: msg,
                    style: "background-color: #fff; color: #666; min-width: 50%;",
                    btn: ["确定"]
                })
            } else {
                layer.open({
                    content: msg,
                    time: 20000
                })
            }
        }
    }
