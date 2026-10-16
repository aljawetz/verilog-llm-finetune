`timescale 1ns/1ps

module tb_mux_8to1_behavioral;

    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_8to1_behavioral uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test sequence
        // Test case 1: Select 0, expect out = in[0]
        in = 8'b10101010; // in = 0xAA
        sel = 3'b000;    // Select first input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 2: Select 1, expect out = in[1]
        sel = 3'b001;    // Select second input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 3: Select 2, expect out = in[2]
        sel = 3'b010;    // Select third input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 4: Select 3, expect out = in[3]
        sel = 3'b011;    // Select fourth input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 5: Select 4, expect out = in[4]
        sel = 3'b100;    // Select fifth input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 6: Select 5, expect out = in[5]
        sel = 3'b101;    // Select sixth input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 7: Select 6, expect out = in[6]
        sel = 3'b110;    // Select seventh input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 8: Select 7, expect out = in[7]
        sel = 3'b111;    // Select eighth input
        #10;
        if (out !== in[sel]) begin
            $display("FAIL: Expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule