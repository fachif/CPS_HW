within CourseExamples.Workshop14.ScriptFunctions;
function SweepParameter2

  input String pathToModel = "CourseExamples.Workshop14.ControlledMotor";
  input String parameterToSweep = "PID.k";
  input Integer nbrSimulations= 3;
algorithm
  translateModel(pathToModel);
  for i in 1:nbrSimulations loop
    simulateModel(pathToModel, stopTime=100, method="dassl", resultFile="ControlledMotor");
  end for;
end SweepParameter2;
