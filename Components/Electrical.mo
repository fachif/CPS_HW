within CourseExamples.Components;
package Electrical
  model ElectricalMotor "This is a simple motor circuit."
    Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited
      motor annotation (Placement(transformation(extent={{-32,-20},{-12,0}})));
    Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
      annotation (Placement(transformation(extent={{-12,32},{-32,52}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-72,12},{-52,32}})));
    Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=ratio)
      annotation (Placement(transformation(extent={{20,-20},{40,0}})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J, w(start=40))
      annotation (Placement(transformation(extent={{60,-20},{80,0}})));
    Modelica.Blocks.Interfaces.RealInput v1
      "Voltage between pin p and n (= p.v - n.v) as input signal" annotation (
        Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-118,50}), iconTransformation(extent={{-120,80},{-100,100}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1
                                            "Right flange of shaft" annotation (
       Placement(transformation(extent={{100,-70},{128,-42}}),
          iconTransformation(extent={{100,-70},{128,-42}})));
    parameter Real ratio=2 "Transmission ratio (flange_a.phi/flange_b.phi)"
      annotation (Dialog(group="Mechanical Parameters"));
    parameter Modelica.SIunits.Inertia J "Moment of inertia"
      annotation (Dialog(group="Mechanical Parameters"));
  equation
    connect(signalVoltage.p, motor.pin_ap) annotation (Line(points={{-12,42},{
            -2,42},{-2,10},{-16,10},{-16,0}}, color={0,0,255}));
    connect(signalVoltage.n, ground.p)
      annotation (Line(points={{-32,42},{-62,42},{-62,32}}, color={0,0,255}));
    connect(motor.pin_an, motor.pin_ep)
      annotation (Line(points={{-28,0},{-32,0},{-32,-4}}, color={0,0,255}));
    connect(motor.pin_en, ground.p) annotation (Line(points={{-32,-16},{-32,-20},
            {-52,-20},{-52,42},{-62,42},{-62,32}}, color={0,0,255}));
    connect(motor.flange, idealGear.flange_a)
      annotation (Line(points={{-12,-10},{20,-10}}, color={0,0,0}));
    connect(idealGear.flange_b, inertia.flange_a)
      annotation (Line(points={{40,-10},{60,-10}}, color={0,0,0}));
    connect(signalVoltage.v, v1) annotation (Line(points={{-22,49},{-118,49},{
            -118,50}}, color={0,0,127}));
    connect(inertia.flange_b, flange_b1) annotation (Line(points={{80,-10},{98,
            -10},{98,-56},{114,-56}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end ElectricalMotor;
end Electrical;
