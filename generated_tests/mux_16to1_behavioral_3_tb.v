`timescale 1ns/1ps

module tb_mux_16to1_behavioral;

    reg [3:0] sel;
    reg [15:0] in;
    wire out;

    // Instantiate the module under test (uut)
    mux_16to1_behavioral uut (
        .sel(sel),
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Select 0, expect out = in[0]
        in = 16'b0000000000000001; // in = 1
        sel = 4'b0000; // select 0
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 2: Select 1, expect out = in[1]
        in = 16'b0000000000000010; // in = 2
        sel = 4'b0001; // select 1
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 3: Select 2, expect out = in[2]
        in = 16'b0000000000000100; // in = 4
        sel = 4'b0010; // select 2
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 4: Select 3, expect out = in[3]
        in = 16'b0000000000001000; // in = 8
        sel = 4'b0011; // select 3
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 5: Select 15, expect out = in[15]
        in = 16'b1000000000000000; // in = 32768
        sel = 4'b1111; // select 15
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Test case 5 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 6: Select 7, expect out = in[7]
        in = 16'b0000000100000000; // in = 128
        sel = 4'b0111; // select 7
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Test case 6 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule