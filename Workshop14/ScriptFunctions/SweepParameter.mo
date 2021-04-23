within CourseExamples.Workshop14.ScriptFunctions;
function SweepParameter

algorithm
pathToModel := "CourseExamples.Workshop14.ControlledMotor";
translateModel(pathToModel);
simulateModel(pathToModel, stopTime=100, method="dassl", resultFile="ControlledMotor");
PID.k := 10;
simulateModel(pathToModel, stopTime=100, method="dassl", resultFile="ControlledMotor");
PID.k := 15;
simulateModel(pathToModel, stopTime=100, method="dassl", resultFile="ControlledMotor");

end SweepParameter;
