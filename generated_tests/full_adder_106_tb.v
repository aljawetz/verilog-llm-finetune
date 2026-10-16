`timescale 1ns/1ps

module tb_full_adder;
    parameter DATA_WIDTH = 4;

    reg [DATA_WIDTH - 1 : 0] A;
    reg [DATA_WIDTH - 1 : 0] B;
    reg Carry_in;
    wire [DATA_WIDTH - 1 : 0] Sum;
    wire Carry_out;

    // Instantiate the full adder
    full_adder #(.DATA_WIDTH(DATA_WIDTH)) uut (
        .A(A),
        .B(B),
        .Carry_in(Carry_in),
        .Sum(Sum),
        .Carry_out(Carry_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        A = 4'b0000; B = 4'b0000; Carry_in = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Carry_out !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 2
        A = 4'b0001; B = 4'b0001; Carry_in = 1'b0;
        #10;
        if (Sum !== 4'b0010 || Carry_out !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 1 + 1 + 1 = 3
        A = 4'b0001; B = 4'b0001; Carry_in = 1'b1;
        #10;
        if (Sum !== 4'b0011 || Carry_out !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 8 + 0 = 15
        A = 4'b0111; B = 4'b1000; Carry_in = 1'b0;
        #10;
        if (Sum !== 4'b1111 || Carry_out !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 8 + 8 + 0 = 16 (check carry out)
        A = 4'b1000; B = 4'b1000; Carry_in = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Carry_out !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 15 + 1 + 0 = 0 (check wrap around)
        A = 4'b1111; B = 4'b0001; Carry_in = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Carry_out !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 15 + 0 + 1 = 0 (check wrap around with carry in)
        A = 4'b1111; B = 4'b0000; Carry_in = 1'b1;
        #10;
        if (Sum !== 4'b0000 || Carry_out !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule