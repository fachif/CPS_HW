within CourseExamples.Workshop18.Linearization;
function LinearizeHeatingSystem
 import Modelica_LinearSystems2.StateSpace;
 import Modelica_LinearSystems2.TransferFunction;
 input String pathToNonlinearPlantModel = "*.HSN";
 input Modelica.SIunits.Time tlin=500 "Linearization time";

algorithm

// LINEARIZE plant model at t_lin
  ss:=Modelica_LinearSystems2.ModelAnalysis.Linearize(pathToNonlinearPlantModel,simulationSetup=Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(linearizeAtInitial=false, t_linearize=tlin));
  // PRINT linear system
  Modelica.Utilities.Streams.print(String(ss));

end LinearizeHeatingSystem;
