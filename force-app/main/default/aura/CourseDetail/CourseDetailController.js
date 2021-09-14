({
    doInit : function(component, event, helper){
        var navEvt = $A.get("e.force:navigateToSObject");
        
        if(navEvt){
          component.set("v.showButton",true);
        }
    },

    navigateToCourse: function(component, event, helper) {

        var navEvt = $A.get("e.force:navigateToSObject");
        
        navEvt.setParams({
            "recordId": component.get("v.course.Id")
        });

        navEvt.fire();
    }
})