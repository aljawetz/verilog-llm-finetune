`timescale 1ns/1ps

module tb_eth_rxstatem;

  reg MRxClk;
  reg Reset;
  reg MRxDV;
  reg ByteCntEq0;
  reg ByteCntGreat2;
  reg MRxDEq5;
  reg Transmitting;
  reg MRxDEqD;
  reg IFGCounterEq24;
  reg ByteCntMaxFrame;
  
  wire [1:0] StateData;
  wire StateIdle;
  wire StateDrop;
  wire StatePreamble;
  wire StateSFD;

  // Instantiate the module under test
  eth_rxstatem uut (
    .MRxClk(MRxClk),
    .Reset(Reset),
    .MRxDV(MRxDV),
    .ByteCntEq0(ByteCntEq0),
    .ByteCntGreat2(ByteCntGreat2),
    .MRxDEq5(MRxDEq5),
    .Transmitting(Transmitting),
    .MRxDEqD(MRxDEqD),
    .IFGCounterEq24(IFGCounterEq24),
    .ByteCntMaxFrame(ByteCntMaxFrame),
    .StateData(StateData),
    .StateIdle(StateIdle),
    .StateDrop(StateDrop),
    .StatePreamble(StatePreamble),
    .StateSFD(StateSFD)
  );

  // Clock generation
  initial begin
    MRxClk = 0;
    forever #5 MRxClk = ~MRxClk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    Reset = 1;
    MRxDV = 0;
    ByteCntEq0 = 0;
    ByteCntGreat2 = 0;
    MRxDEq5 = 0;
    Transmitting = 0;
    MRxDEqD = 0;
    IFGCounterEq24 = 0;
    ByteCntMaxFrame = 0;

    // Release reset
    #10 Reset = 0;

    // Test Idle state
    #10;
    if (!StateIdle || StateDrop || StatePreamble || StateSFD) begin
      $display("FAIL: Initial state should be Idle");
      $finish;
    end

    // Transition to Preamble state
    MRxDV = 1; // Start receiving
    #10;
    if (!StatePreamble || StateIdle || StateDrop || StateSFD) begin
      $display("FAIL: Should be in Preamble state");
      $finish;
    end

    // Transition to SFD state
    MRxDEq5 = 1; // End of preamble detected
    #10;
    if (!StateSFD || StateIdle || StateDrop || !StatePreamble) begin
      $display("FAIL: Should be in SFD state");
      $finish;
    end

    // Transition to Data state
    MRxDEqD = 1; // Data starts
    IFGCounterEq24 = 1; // IFG condition met
    #10;
    if (StateIdle || StateDrop || StatePreamble || StateSFD) begin
      $display("FAIL: Should be in Data state");
      $finish;
    end

    // Simulate receiving data
    ByteCntMaxFrame = 1; // Simulate max frame condition
    #10;
    if (!StateDrop) begin
      $display("FAIL: Should transition to Drop state due to max frame");
      $finish;
    end

    // Reset and check state
    #10 Reset = 1;
    #10 Reset = 0;
    #10;
    if (!StateIdle) begin
      $display("FAIL: After reset, should be in Idle state");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule