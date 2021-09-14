({
    onFormSubmit : function(component, event, helper) {
        var formData = event.getParam("formData");

        var courseLevelId = formData.courseLevelId;

        //alert('--------->'+courseLevelId);

        var coursePositionId = formData.coursePositionId;
        //alert('--------->'+coursePositionId);

        var CSRcmp = component.find("CSRcmp");

        var auraMethodResult = CSRcmp.search(courseLevelId,coursePositionId);
    }
})