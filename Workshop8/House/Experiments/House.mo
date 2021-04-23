within CourseExamples.Workshop8.House.Experiments;
model House
  Rooms.Room House
    annotation (Placement(transformation(extent={{36,-10},{60,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outTEMPERATURE
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Sine sineTEMP(
    amplitude=5,
    freqHz=1/86400,
    phase=-1.5707963267949,
    offset=273.15)
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
equation
  connect(outTEMPERATURE.port, House.wallPort)
    annotation (Line(points={{0,0},{39.8,0}}, color={191,0,0}));
  connect(sineTEMP.y, outTEMPERATURE.T)
    annotation (Line(points={{-55,0},{-22,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end House;
