`timescale 1ns/1ps

module tb_pes_rca;

    reg [15:0] A;
    reg [15:0] B;
    reg Cin;
    wire [15:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    pes_rca uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        A = 16'h0000; B = 16'h0000; Cin = 1'b0;
        #10;
        if (Sum !== 16'h0000 || Cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 2
        A = 16'h0001; B = 16'h0001; Cin = 1'b0;
        #10;
        if (Sum !== 16'h0002 || Cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 1 + 1 + 1 = 3
        A = 16'h0001; B = 16'h0001; Cin = 1'b1;
        #10;
        if (Sum !== 16'h0003 || Cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: Max value + 1
        A = 16'hFFFF; B = 16'h0001; Cin = 1'b0;
        #10;
        if (Sum !== 16'h0000 || Cout !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: 0x1234 + 0x5678 + 0 = 0x68AC
        A = 16'h1234; B = 16'h5678; Cin = 1'b0;
        #10;
        if (Sum !== 16'h68AC || Cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 0xFFFF + 0xFFFF + 1 = 0xFFFF with Cout = 1
        A = 16'hFFFF; B = 16'hFFFF; Cin = 1'b1;
        #10;
        if (Sum !== 16'hFFFF || Cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 0x7FFF + 0x7FFF + 1 = 0xFFFF with Cout = 1
        A = 16'h7FFF; B = 16'h7FFF; Cin = 1'b1;
        #10;
        if (Sum !== 16'hFFFF || Cout !== 1'b1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule