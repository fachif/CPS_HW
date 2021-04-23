within CourseExamples.Workshop8.House.Experiments;
model WindowHouse
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outTEMPERATURE
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Constant const(k=273.15)
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Rooms.WindowRoom House
    annotation (Placement(transformation(extent={{16,-20},{64,20}})));
  Modelica.Blocks.Sources.Sine radiation(
    amplitude=500,
    freqHz=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(extent={{96,-76},{76,-56}})));
  Modelica.Blocks.Sources.Sine theta(
    amplitude=55.5,
    freqHz=1/86400,
    phase=1.5707963267949,
    offset=97.5)
    annotation (Placement(transformation(extent={{96,46},{76,66}})));
equation
  connect(const.y, outTEMPERATURE.T)
    annotation (Line(points={{-55,0},{-22,0}}, color={0,0,127}));
  connect(House.winPORT, outTEMPERATURE.port) annotation (Line(points={{57.4857,
          1.2},{74,1.2},{74,22},{10,22},{10,0},{0,0}}, color={191,0,0}));
  connect(House.wallPort, outTEMPERATURE.port)
    annotation (Line(points={{22.5143,0},{0,0}},
                                              color={191,0,0}));
  connect(radiation.y, House.radiation1) annotation (Line(points={{75,-66},{64,
          -66},{64,-28},{86,-28},{86,-6},{60.2286,-6},{60.2286,-8}}, color={0,0,
          127}));
  connect(theta.y, House.theta) annotation (Line(points={{75,56},{64,56},{64,28},
          {92,28},{92,-14.8},{60.2286,-14.8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WindowHouse;
