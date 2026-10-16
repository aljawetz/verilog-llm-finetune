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
    forever #5 MRxClk = ~MRxClk; // 10ns clock period
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

    // Test Idle State
    #10;
    if (StateIdle !== 1 || StateDrop !== 0 || StatePreamble !== 0 || StateSFD !== 0) 
        $display("FAIL: Initial state should be Idle");
    
    // Test Preamble State
    MRxDV = 1; // Start receiving
    #10;
    if (StatePreamble !== 1 || StateIdle !== 0) 
        $display("FAIL: Should be in Preamble state");

    // Test SFD State
    MRxDEq5 = 1; // Indicate SFD detected
    #10;
    if (StateSFD !== 1 || StatePreamble !== 0) 
        $display("FAIL: Should be in SFD state");

    // Test Data State
    MRxDEqD = 1; // Indicate data is being received
    IFGCounterEq24 = 1; // Simulate IFG counter
    #10;
    if (StateData !== 2'b01) 
        $display("FAIL: Should be in Data state 0");

    // Test Data State Transition
    ByteCntMaxFrame = 1; // Simulate max frame condition
    #10;
    if (StateData !== 2'b00) 
        $display("FAIL: Should transition to Data state 1");

    // Test Drop State
    Transmitting = 1; // Start transmitting
    #10;
    if (StateDrop !== 1) 
        $display("FAIL: Should be in Drop state");

    // Reset and check idle state again
    Reset = 1;
    #10 Reset = 0;
    #10;
    if (StateIdle !== 1 || StateDrop !== 0) 
        $display("FAIL: Should return to Idle state after reset");

    $display("PASS");
    $finish;
end

endmodule