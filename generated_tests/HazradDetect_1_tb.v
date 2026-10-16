`timescale 1ns/1ps

module tb_HazradDetect;

    reg [4:0] IF_IDrs1_i;
    reg [4:0] IF_IDrs2_i;
    reg [4:0] ID_EXrd_i;
    reg ID_EX_MemRead_i;
    wire Hazard_o;

    // Instantiate the module under test (uut)
    HazradDetect uut (
        .IF_IDrs1_i(IF_IDrs1_i),
        .IF_IDrs2_i(IF_IDrs2_i),
        .ID_EXrd_i(ID_EXrd_i),
        .ID_EX_MemRead_i(ID_EX_MemRead_i),
        .Hazard_o(Hazard_o)
    );

    initial begin
        // Test Case 1: No hazard (MemRead is low)
        IF_IDrs1_i = 5'b00001; // Register 1
        IF_IDrs2_i = 5'b00010; // Register 2
        ID_EXrd_i = 5'b00011;  // Register 3
        ID_EX_MemRead_i = 1'b0; // No memory read
        #10;
        if (Hazard_o !== 1'b0) begin
            $display("FAIL: Test Case 1 failed. Expected Hazard_o = 0, got %b", Hazard_o);
            $finish;
        end

        // Test Case 2: Hazard detected (MemRead is high, ID_EXrd matches IF_IDrs1)
        ID_EX_MemRead_i = 1'b1; // Memory read
        ID_EXrd_i = 5'b00001;   // Register 1 matches IF_IDrs1
        #10;
        if (Hazard_o !== 1'b1) begin
            $display("FAIL: Test Case 2 failed. Expected Hazard_o = 1, got %b", Hazard_o);
            $finish;
        end

        // Test Case 3: Hazard detected (MemRead is high, ID_EXrd matches IF_IDrs2)
        ID_EXrd_i = 5'b00010;   // Register 2 matches IF_IDrs2
        #10;
        if (Hazard_o !== 1'b1) begin
            $display("FAIL: Test Case 3 failed. Expected Hazard_o = 1, got %b", Hazard_o);
            $finish;
        end

        // Test Case 4: No hazard (MemRead is high, ID_EXrd does not match)
        ID_EXrd_i = 5'b00011;   // Register 3 does not match IF_IDrs1 or IF_IDrs2
        #10;
        if (Hazard_o !== 1'b0) begin
            $display("FAIL: Test Case 4 failed. Expected Hazard_o = 0, got %b", Hazard_o);
            $finish;
        end

        // Test Case 5: Both IF_IDrs1 and IF_IDrs2 are the same as ID_EXrd
        IF_IDrs1_i = 5'b00001; // Register 1
        IF_IDrs2_i = 5'b00001; // Register 1
        ID_EXrd_i = 5'b00001;  // Register 1 matches both
        ID_EX_MemRead_i = 1'b1; // Memory read
        #10;
        if (Hazard_o !== 1'b1) begin
            $display("FAIL: Test Case 5 failed. Expected Hazard_o = 1, got %b", Hazard_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule