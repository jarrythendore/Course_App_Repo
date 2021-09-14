({
    doInit : function(component, event, helper) {
		helper.onSearch(component);
	},

    search : function(component, event, helper){
		var params = event.getParam("arguments");
		//alert('>>'+params.coursePositionId);
		component.set("v.courseLevelId",params.courseLevelId);
		component.set("v.coursePositionId",params.coursePositionId);
		helper.onSearch(component);
	}
})