`timescale 1ns/1ps

module tb_demux1_4;

    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    // Instantiate the demux1_4 module
    demux1_4 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Input = 1, Select = 00
        in = 1; sel = 2'b00; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 2: Input = 1, Select = 01
        in = 1; sel = 2'b01; #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 3: Input = 1, Select = 10
        in = 1; sel = 2'b10; #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 4: Input = 1, Select = 11
        in = 1; sel = 2'b11; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 5: Input = 0, Select = 00
        in = 0; sel = 2'b00; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 6: Input = 0, Select = 01
        in = 0; sel = 2'b01; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 7: Input = 0, Select = 10
        in = 0; sel = 2'b10; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 8: Input = 0, Select = 11
        in = 0; sel = 2'b11; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected 0000, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule