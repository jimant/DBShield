/***********************************************************************************************
  페이징   
 Version 1.0
  작성자 : 정상헌
  작성일 : 2008년 1월 24일
  설명 : 게시판의 페이징에 쓰인다.
***********************************************************************************************/

// var Paging = Class.create();
var Paging = {};

Paging.prototype = {
    /***********************************************************************************************
            생성자 (cPage:현재 페이지, pageSize:한 페이지에 보여줄 Row 수, pageGroupSize:페이지 그룹 수)
    ***********************************************************************************************/
    initialize: function(pageSize, pageGroupSize) {
        this.cPage = 1;
        this.pageSize = pageSize ? pageSize : 10;
        this.pageGroupSize = pageGroupSize ? pageGroupSize : 10;
        this.totalRow;
        this.totalPage;
        this.startPage;
        this.endPage;
        this.preImgSrc = "/admin/images/btn/pre_btn.gif";
        this.nextImgSrc = "/admin/images/btn/next_btn.gif";
        this.firstImgSrc = "/admin/images/btn/first_btn.gif";
        this.lastImgSrc = "/admin/images/btn/last_btn.gif";
    },
    
    setPaging: function (cPage, totalRow, pageAreaId, pageCallBackStr) {
        // 총 페이지 수를 구한다.
        this.cPage = cPage ? cPage : 1;
        this.totalRow = totalRow ? totalRow : 0;
        if (this.totalRow % this.pageSize == 0) {
            this.totalPage = this.totalRow / this.pageSize;
        } else {
            this.totalPage = parseInt(this.totalRow / this.pageSize) + 1;
        }
        
        if(this.cPage > this.totalPage) {
            this.cPage = this.totalPage;
        }
        
        if(this.cPage < 1) {
            this.cPage = 1;
        }
        
        // 페이지 그룹의 시작 페이지와 마지막 페이지 설정
        this.startPage = parseInt((this.cPage - 1) / this.pageGroupSize) * this.pageGroupSize + 1;
        this.endPage = this.startPage + this.pageGroupSize - 1;
        if(this.endPage > this.totalPage) {
            this.endPage = this.totalPage;
        }
        
        var pageArea = $(pageAreaId);
        pageArea.html("");
        
        var pagingHTML = "";
        for (var pg = this.startPage; pg <= this.endPage; pg++) {
            if(this.cPage == pg) {
                pagingHTML += "<span class=\"selectedPage\">[" + pg + "]</span>";
            } else {
                pagingHTML += "<span class=\"noneSelectedPage\"><a style=\"color:black;\" href=\"javascript:" + pageCallBackStr + "(" + pg + ")\">" + pg + "</a></span>";
            }
        }

        // 맨 앞, 이전 표시
        var imgStr = "";
        if ((this.startPage > this.pageSize)) {
            imgStr += "<a href=\"javascript:" + pageCallBackStr + "(1)\">";
            imgStr += "<img src=\"" + this.firstImgSrc + "\" class=\"pagingImg\" /></a>";
            imgStr += "<a href=\"javascript:" + pageCallBackStr + "(" + (this.startPage - 1) + ")\">";
            imgStr += "<img src=\"" + this.preImgSrc + "\" class=\"pagingImg\" /></a>";
            pagingHTML = imgStr + pagingHTML;
        }
        
        if (this.endPage < this.totalPage) {
            pagingHTML += "<a href=\"javascript:" + pageCallBackStr + "(" + (this.endPage + 1) + ")\">";
            pagingHTML += "<img src=\"" + this.nextImgSrc + "\" class=\"pagingImg\" /></a>";
            pagingHTML += "<a href=\"javascript:" + pageCallBackStr + "(" + (this.totalPage) + ")\">";
            pagingHTML += "<img src=\"" + this.lastImgSrc + "\" class=\"pagingImg\" /></a>";
        }

        
        pageArea.html(pagingHTML);
    },
    
    setPageSize: function(page_size){
    	this.pageSize = page_size;
    }
}