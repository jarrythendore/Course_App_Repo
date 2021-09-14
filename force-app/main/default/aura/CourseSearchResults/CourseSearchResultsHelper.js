({
	onSearch: function (component) {
		var action = component.get("c.getCourses");
		var self = this;

		var courseLevelIdPara = component.get("v.courseLevelId");
		//alert('--->'+courseLevelIdPara);

		var coursePositionIdPara = component.get("v.coursePositionId");
		//alert('--->'+coursePositionIdPara);
		// send to controller
		action.setParams({
			"courseLevelId": courseLevelIdPara,
			"coursePositionId": coursePositionIdPara
		});

		action.setCallback(this, function (response) {
			var state = response.getState();
			//alert('--->'+state);
			if (state === "SUCCESS") {
				component.set("v.courses", response.getReturnValue());
			}
			else if (state === "ERROR") {
				var errors = response.getError();
				if (errors) {
					if (errors[0] && errors[0].message) {
						alert('Error:' + errors[0].message);
					}
				}
			}


		});

		$A.enqueueAction(action);
	}
})