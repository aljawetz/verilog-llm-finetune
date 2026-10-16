`timescale 1ns/1ps

module tb_MUX6to1;

    reg [5:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the MUX6to1 module
    MUX6to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        in = 6'b101010; sel = 3'b000; #10;
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);
            $finish;
        end

        // Test case 2: Select input 1
        in = 6'b101010; sel = 3'b001; #10;
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);
            $finish;
        end

        // Test case 3: Select input 2
        in = 6'b101010; sel = 3'b010; #10;
        if (out !== in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);
            $finish;
        end

        // Test case 4: Select input 3
        in = 6'b101010; sel = 3'b011; #10;
        if (out !== in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);
            $finish;
        end

        // Test case 5: Select input 4
        in = 6'b101010; sel = 3'b100; #10;
        if (out !== in[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);
            $finish;
        end

        // Test case 6: Select input 5
        in = 6'b101010; sel = 3'b101; #10;
        if (out !== in[5]) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule