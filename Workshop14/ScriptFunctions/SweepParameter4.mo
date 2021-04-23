within CourseExamples.Workshop14.ScriptFunctions;
function SweepParameter4

  input String pathToModel = "CourseExamples.Workshop14.ControlledMotor";
  input String parameterToSweep = "PID.k";
  input Integer nbrSimulations = 3;
  input Real startValue;
  input Real endValue;

protected
  Real [:] parameterValues;

algorithm
  parameterValues :=linspace(startValue, endValue, nbrSimulations);
  translateModel(pathToModel);
  for i in 1:nbrSimulations loop
    simulateExtendedModel(pathToModel, stopTime=100, method="dassl", resultFile="ControlledMotor",
                          initialNames={parameterToSweep},
                          initialValues={parameterValues[i]},
                          finalNames={parameterToSweep});
  end for;
end SweepParameter4;
