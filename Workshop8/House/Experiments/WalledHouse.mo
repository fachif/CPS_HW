within CourseExamples.Workshop8.House.Experiments;
model WalledHouse
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outTEMPERATURE
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Sine sineTEMP(
    amplitude=5,
    freqHz=1/86400,
    phase=-1.5707963267949,
    offset=273.15)
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Rooms.WalledRoom walledRoom(G_wall=375)
    annotation (Placement(transformation(extent={{22,-16},{60,16}})));
equation
  connect(sineTEMP.y, outTEMPERATURE.T)
    annotation (Line(points={{-55,0},{-22,0}}, color={0,0,127}));
  connect(walledRoom.wallPort, outTEMPERATURE.port)
    annotation (Line(points={{28.0167,0},{0,0}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WalledHouse;
