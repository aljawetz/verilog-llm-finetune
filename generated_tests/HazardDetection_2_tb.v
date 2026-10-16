`timescale 1ns/1ps

module tb_HazardDetection;

reg [4:0] IF_ID_RegisterRs1;
reg [4:0] IF_ID_RegisterRs2;
reg [4:0] ID_EX_RegisterRd;
reg ID_EX_MemRead;
wire stall;

// Instantiate the module under test
HazardDetection uut (
    .IF_ID_RegisterRs1(IF_ID_RegisterRs1),
    .IF_ID_RegisterRs2(IF_ID_RegisterRs2),
    .ID_EX_RegisterRd(ID_EX_RegisterRd),
    .ID_EX_MemRead(ID_EX_MemRead),
    .stall(stall)
);

initial begin
    // Test case 1: No hazard (stall should be 0)
    IF_ID_RegisterRs1 = 5'b00001; // Rs1
    IF_ID_RegisterRs2 = 5'b00010; // Rs2
    ID_EX_RegisterRd = 5'b00011;  // Rd
    ID_EX_MemRead = 0;             // No memory read
    #10;
    if (stall !== 0) begin
        $display("FAIL: Test case 1 failed, expected stall=0, got stall=%b", stall);
        $finish;
    end

    // Test case 2: Hazard detected (stall should be 0)
    IF_ID_RegisterRs1 = 5'b00001; // Rs1
    IF_ID_RegisterRs2 = 5'b00010; // Rs2
    ID_EX_RegisterRd = 5'b00001;  // Rd matches Rs1
    ID_EX_MemRead = 1;             // Memory read detected
    #10;
    if (stall !== 0) begin
        $display("FAIL: Test case 2 failed, expected stall=0, got stall=%b", stall);
        $finish;
    end

    // Test case 3: Hazard detected (stall should be 0)
    IF_ID_RegisterRs1 = 5'b00010; // Rs1 matches Rd
    IF_ID_RegisterRs2 = 5'b00001; // Rs2
    ID_EX_RegisterRd = 5'b00010;  // Rd matches Rs1
    ID_EX_MemRead = 1;             // Memory read detected
    #10;
    if (stall !== 0) begin
        $display("FAIL: Test case 3 failed, expected stall=0, got stall=%b", stall);
        $finish;
    end

    // Test case 4: Hazard detected (stall should be 0)
    IF_ID_RegisterRs1 = 5'b00011; // Rs1
    IF_ID_RegisterRs2 = 5'b00001; // Rs2
    ID_EX_RegisterRd = 5'b00011;  // Rd matches Rs1
    ID_EX_MemRead = 1;             // Memory read detected
    #10;
    if (stall !== 0) begin
        $display("FAIL: Test case 4 failed, expected stall=0, got stall=%b", stall);
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule