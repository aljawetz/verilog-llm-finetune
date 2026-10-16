`timescale 1ns/1ps

module tb_HazardDetection;

    reg [4:0] IF_ID_RegisterRs1;
    reg [4:0] IF_ID_RegisterRs2;
    reg [4:0] ID_EX_RegisterRd;
    reg ID_EX_MemRead;
    wire stall;

    // Instantiate the module under test (uut)
    HazardDetection uut (
        .IF_ID_RegisterRs1(IF_ID_RegisterRs1),
        .IF_ID_RegisterRs2(IF_ID_RegisterRs2),
        .ID_EX_RegisterRd(ID_EX_RegisterRd),
        .ID_EX_MemRead(ID_EX_MemRead),
        .stall(stall)
    );

    initial begin
        // Test case 1: No hazard (stall should be 0)
        IF_ID_RegisterRs1 = 5'b00001; // Rs1 = R1
        IF_ID_RegisterRs2 = 5'b00010; // Rs2 = R2
        ID_EX_RegisterRd = 5'b00011;  // Rd = R3
        ID_EX_MemRead = 1'b0;          // No memory read
        #10;
        if (stall !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected stall=0, got stall=%b", stall);
            $finish;
        end

        // Test case 2: Load-use hazard detected (stall should be 0)
        IF_ID_RegisterRs1 = 5'b00001; // Rs1 = R1
        IF_ID_RegisterRs2 = 5'b00010; // Rs2 = R2
        ID_EX_RegisterRd = 5'b00001;  // Rd = R1 (hazard)
        ID_EX_MemRead = 1'b1;          // Memory read
        #10;
        if (stall !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected stall=0, got stall=%b", stall);
            $finish;
        end

        // Test case 3: No hazard (stall should be 0)
        IF_ID_RegisterRs1 = 5'b00011; // Rs1 = R3
        IF_ID_RegisterRs2 = 5'b00100; // Rs2 = R4
        ID_EX_RegisterRd = 5'b00010;  // Rd = R2
        ID_EX_MemRead = 1'b0;          // No memory read
        #10;
        if (stall !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected stall=0, got stall=%b", stall);
            $finish;
        end

        // Test case 4: Load-use hazard detected (stall should be 0)
        IF_ID_RegisterRs1 = 5'b00101; // Rs1 = R5
        IF_ID_RegisterRs2 = 5'b00001; // Rs2 = R1 (hazard)
        ID_EX_RegisterRd = 5'b00101;  // Rd = R5 (hazard)
        ID_EX_MemRead = 1'b1;          // Memory read
        #10;
        if (stall !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected stall=0, got stall=%b", stall);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule