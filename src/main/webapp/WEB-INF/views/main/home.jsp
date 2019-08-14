<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<title>메인화면</title>
<style>
	*{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
     }
	/* body스타일 시작 */
    #mainImg{
        border: 1px solid navy;
        position: relative;
        height: 360px;
    }
    #mainImgContents{
        border: 1px solid chartreuse;
        max-width: 1050px;
        margin: 0 auto;
        height: 360px;
    }
    #mainImgServeyList{
        border: 1px solid teal;
        width: 375px;
        height: 360px;
    }
    #mainContents{
        border: 1px solid darkblue;
        overflow: hidden;
    }
    #noticeBox{
        border: 1px solid darkmagenta;
        max-width: 1050px;
        margin: 0 auto;
        margin-top: 10px;
        position: relative;
        line-height: 43px;
        height: 43px;
    }
    #totalContentsBox{
        border: 1px solid darkmagenta;
        max-width: 1050px;
        margin: 0 auto;
        margin-top: 5px;
        position: relative;
        height: 43px;
    }
    #menuBox{
        border: 1px solid blue;
        max-width: 1050px;
        margin: 0 auto;
        margin-top: 20px;
        position: relative;
        height: 200px;
    }
    .menuBoxs{
        border: 1px solid yellowgreen;
        border-radius: 20%;
        float: left;
        height: 200px;
        width: calc(100% / 4);
    }
    #rankBox{
        border: 1px solid red;
        max-width: 1050px;
        margin: 0 auto;
        margin-top: 20px;
        position: relative;
        height: 600px;
    }
    #hotRank{
        border: 1px solid yellow;
        width: 520px;
        height: 600px;
        display: inline-block;
    }
    #newRank{
        border: 1px solid blue;
        width: 520px;
        height: 600px;
        display: inline-block;
    }
    .Ranks{
        border: 1px solid deeppink;
        border-radius: 5%;
        margin: 20px;
        height: 150px;
    }
</style>
</head>

<!-- body시작 -->
<div id="body" style="min-height: 800px">
    <div id="mainImg">
        <div id="mainImgContents">
            <div id="mainImgServeyList"></div>
        </div>
    </div>

    <div id="mainContents">
        <div id="noticeBox"></div>
        <div id="totalContentsBox"></div>
        <div id="menuBox">
            <div class="menuBoxs"></div>
            <div class="menuBoxs"></div>
            <div class="menuBoxs"></div>
            <div class="menuBoxs"></div>
        </div>
        <div id="rankBox">
            <div id="hotRank">
                <h1>HotRank3</h1>
                <div class="Ranks">TOP1</div>
                <div class="Ranks">TOP2</div>
                <div class="Ranks">TOP3</div>
            </div>
            <div id="newRank">
                <h1>NewRank3</h1>
                <div class="Ranks">TOP1</div>
                <div class="Ranks">TOP2</div>
                <div class="Ranks">TOP3</div>
            </div>
        </div>
    </div>
</div>
<!-- body끝 -->

