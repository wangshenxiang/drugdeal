/**
 * Created by wangshenxiang on 15-3-20.
 */
function doCheck(v) {
    if ($('#id').val() == '' || $('#name').val() == ''
        || $('#suoxie').val() == '' || $('#spec').val() == ''
        || $('#price').val() == '' || $('#product').val() == ''
        || $('#numbers').val() == '') {
        $('#prompt').css('display', '');
        $('#prompt').html('信息填写不完整');
        return false;
    }
    return true;
}

var isDrugExistedById = function(id) {
    if (id == '') {
        return false;
    }
    var res = false;
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/drugdeal/isDrugExisted?id=" + id,
        async: false,
        success: function (ret) {
            if(ret) {
                res = true;
            } else {
                res = false;
            }
        }
    });
    return res;
}

var isDrugExisted = function (v) {
    if (v.value == '') {
        return false;
    }
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/drugdeal/isDrugExisted?id="+ v.value,
        async: false,
        success: function (ret) {
            if(ret) {
                $('#idPrompt').css('display', '');
                $('#name').css('display', 'none');
                $('#suoxie').css('display', 'none');
                $('#spec').css('display', 'none');
                $('#price').css('display', 'none');
                $('#product').css('display', 'none');
                $('#numbers').css('display', 'none');
                $('#memo').css('display', 'none');
                $('#submit').css('display', 'none');
                $('#idPrompt').html("此药品已存在，请确认id输入是否有误，或<a href=\"/drugdeal/route/updateDrug?id="
                    + v.value +
                    "\">跳转</a>到此id药品的更新修改页面");
            } else {
                $('#idPrompt').css('display', 'none');
                $('#name').css('display', '');
                $('#suoxie').css('display', '');
                $('#spec').css('display', '');
                $('#price').css('display', '');
                $('#product').css('display', '');
                $('#numbers').css('display', '');
                $('#memo').css('display', '');
                $('#submit').css('display', '');
            }
        }
    });
}

function upCase(v) {
    if (v.value == '') {
        return false;
    }
    v.value = v.value.toUpperCase();
}
function toPrice(v) {
    if (v.value == ''
        || v.value.substring(0,2) == "Na") {
        v.value = '';
        return;
    }
    var len = v.value.length;
    if (v.value.substring(len-1,len) == '.'
        || v.value.substring(len-2,len) == ".0"
        || v.value.substring(len-3,len) == ".00") {
        return;
    }
    if (v.value.indexOf('.') != 0
        && v.value.indexOf('.') != -1
        && len - v.value.indexOf('.') > 3) {
        v.value = v.value.substring(0, len-1);
    }
    if( v.value.substring(len-4,len-1) == ".00") {
        v.value = v.value.substring(0, len-1);
        return;
    }
    v.value = parseFloat(v.value);
}
function toInt(v) {
    if (v.value == ''
        || v.value.substring(0,2) == "Na") {
        v.value = '';
        return;
    }
    v.value = parseInt(v.value);
}

function readDrug(v) {
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/drugdeal/readDrug?id="+ v,
        async: false,
        success: function (ret) {
            if(ret) {
                $('#id').val(ret.id);
                $('#name').val(ret.name);
                $('#suoxie').val(ret.suoxie);
                $('#spec').val(ret.spec);
                $('#price').val(ret.price);
                $('#product').val(ret.product);
                $('#numbers').val(ret.numbers);
                $('#memo').val(ret.memo);
            }
        }
    });
}