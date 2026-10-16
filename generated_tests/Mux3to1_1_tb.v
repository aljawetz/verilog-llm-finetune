`timescale 1ns/1ps

module tb_Mux3to1;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg [31:0] c;
    reg [1:0] select;

    // Output
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    Mux3to1 uut (
        .a(a),
        .b(b),
        .c(c),
        .select(select),
        .out(out)
    );

    initial begin
        // Initialize inputs
        a = 32'hA5A5A5A5;
        b = 32'h5A5A5A5A;
        c = 32'hFFFFFFFF;
        select = 2'b00;

        // Test case 1: Select input a
        #10;
        if (out !== a) begin
            $display("FAIL: Test case 1 failed, expected %h, got %h", a, out);
            $finish;
        end

        // Test case 2: Select input b
        select = 2'b01;
        #10;
        if (out !== b) begin
            $display("FAIL: Test case 2 failed, expected %h, got %h", b, out);
            $finish;
        end

        // Test case 3: Select input c
        select = 2'b10;
        #10;
        if (out !== c) begin
            $display("FAIL: Test case 3 failed, expected %h, got %h", c, out);
            $finish;
        end

        // Test case 4: Invalid select (default case)
        select = 2'b11;
        #10;
        if (out !== 32'd0) begin
            $display("FAIL: Test case 4 failed, expected 0, got %h", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule