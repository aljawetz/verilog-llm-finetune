`timescale 1ns/1ps

module tb_cmpPiece;

    // Inputs
    reg [3:0] inPoss_0;
    reg [6:0] inIdx_0;
    reg [3:0] inPoss_1;
    reg [6:0] inIdx_1;

    // Outputs
    wire [3:0] outPoss;
    wire [6:0] outIdx;

    // Instantiate the Unit Under Test (UUT)
    cmpPiece uut (
        .inPoss_0(inPoss_0),
        .inIdx_0(inIdx_0),
        .inPoss_1(inPoss_1),
        .inIdx_1(inIdx_1),
        .outPoss(outPoss),
        .outIdx(outIdx)
    );

    initial begin
        // Test case 1
        inPoss_0 = 4'b0010; // 2
        inIdx_0 = 7'b0000001; // 1
        inPoss_1 = 4'b0100; // 4
        inIdx_1 = 7'b0000010; // 2
        #10;
        if (outPoss !== 4'b0010 || outIdx !== 7'b0000001) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2
        inPoss_0 = 4'b0110; // 6
        inIdx_0 = 7'b0000011; // 3
        inPoss_1 = 4'b0011; // 3
        inIdx_1 = 7'b0000100; // 4
        #10;
        if (outPoss !== 4'b0011 || outIdx !== 7'b0000100) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3
        inPoss_0 = 4'b0001; // 1
        inIdx_0 = 7'b0000000; // 0
        inPoss_1 = 4'b0001; // 1
        inIdx_1 = 7'b0000001; // 1
        #10;
        if (outPoss !== 4'b0001 || outIdx !== 7'b0000001) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4
        inPoss_0 = 4'b1111; // 15
        inIdx_0 = 7'b0000111; // 7
        inPoss_1 = 4'b1000; // 8
        inIdx_1 = 7'b0000101; // 5
        #10;
        if (outPoss !== 4'b1000 || outIdx !== 7'b0000101) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5
        inPoss_0 = 4'b0101; // 5
        inIdx_0 = 7'b0001000; // 8
        inPoss_1 = 4'b0101; // 5
        inIdx_1 = 7'b0001001; // 9
        #10;
        if (outPoss !== 4'b0101 || outIdx !== 7'b0001001) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule