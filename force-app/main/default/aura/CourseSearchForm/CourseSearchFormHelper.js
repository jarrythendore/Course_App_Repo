({
    h_getAllCourseLevel : function(component) {
        var action = component.get("c.apex_getAllCourseLevel");
		
        // page is not loading if remove this
		var self = this;

        action.setCallback(this, function(r){
			component.set("v.courselevellist",r.getReturnValue());
		});

        $A.enqueueAction(action);
    },

    h_getAllCoursePosition : function(component) {
        var action = component.get("c.apex_getAllCoursePosition");
		
        // page is not loading if remove this
		var self = this;

        action.setCallback(this, function(r){
			component.set("v.coursepositionlist",r.getReturnValue());
		});

        $A.enqueueAction(action);
    }
})