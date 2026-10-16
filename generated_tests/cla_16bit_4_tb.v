`timescale 1ns/1ps

module tb_cla_16bit;

    reg [15:0] A;
    reg [15:0] B;
    reg Cin;
    wire [15:0] S;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    cla_16bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: A = 0, B = 0, Cin = 0
        A = 16'b0000000000000000;
        B = 16'b0000000000000000;
        Cin = 0;
        #10;
        if (S !== 16'b0000000000000000 || Cout !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 1, B = 1, Cin = 0
        A = 16'b0000000000000001;
        B = 16'b0000000000000001;
        Cin = 0;
        #10;
        if (S !== 16'b0000000000000010 || Cout !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 1, B = 1, Cin = 1
        A = 16'b0000000000000001;
        B = 16'b0000000000000001;
        Cin = 1;
        #10;
        if (S !== 16'b0000000000000011 || Cout !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 15, B = 1, Cin = 0
        A = 16'b0000000000001111;
        B = 16'b0000000000000001;
        Cin = 0;
        #10;
        if (S !== 16'b0000000000010000 || Cout !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 15, B = 1, Cin = 1
        A = 16'b0000000000001111;
        B = 16'b0000000000000001;
        Cin = 1;
        #10;
        if (S !== 16'b0000000000010001 || Cout !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 65535, B = 1, Cin = 0 (max value)
        A = 16'b1111111111111111;
        B = 16'b0000000000000001;
        Cin = 0;
        #10;
        if (S !== 16'b0000000000000000 || Cout !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A = 65535, B = 1, Cin = 1 (max value + 1)
        A = 16'b1111111111111111;
        B = 16'b0000000000000001;
        Cin = 1;
        #10;
        if (S !== 16'b0000000000000001 || Cout !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule