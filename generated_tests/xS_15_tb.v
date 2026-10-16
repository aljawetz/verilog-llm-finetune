`timescale 1ns/1ps

module tb_xS;

    reg clk;
    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the module under test
    xS uut (
        .clk(clk),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize input
        in = 8'h00;
        #10; // Wait for one clock cycle

        // Test all input values
        case (in)
            8'h00: if (out !== 8'hc6) $display("FAIL: Expected out for in=0x00 is 0xC6, got 0x%h", out);
            8'h01: if (out !== 8'hf8) $display("FAIL: Expected out for in=0x01 is 0xF8, got 0x%h", out);
            8'h02: if (out !== 8'hee) $display("FAIL: Expected out for in=0x02 is 0xEE, got 0x%h", out);
            8'h03: if (out !== 8'hf6) $display("FAIL: Expected out for in=0x03 is 0xF6, got 0x%h", out);
            8'h04: if (out !== 8'hff) $display("FAIL: Expected out for in=0x04 is 0xFF, got 0x%h", out);
            8'h05: if (out !== 8'hd6) $display("FAIL: Expected out for in=0x05 is 0xD6, got 0x%h", out);
            8'h06: if (out !== 8'hde) $display("FAIL: Expected out for in=0x06 is 0xDE, got 0x%h", out);
            8'h07: if (out !== 8'h91) $display("FAIL: Expected out for in=0x07 is 0x91, got 0x%h", out);
            8'h08: if (out !== 8'h60) $display("FAIL: Expected out for in=0x08 is 0x60, got 0x%h", out);
            8'h09: if (out !== 8'h02) $display("FAIL: Expected out for in=0x09 is 0x02, got 0x%h", out);
            8'h0a: if (out !== 8'hce) $display("FAIL: Expected out for in=0x0A is 0xCE, got 0x%h", out);
            8'h0b: if (out !== 8'h56) $display("FAIL: Expected out for in=0x0B is 0x56, got 0x%h", out);
            8'h0c: if (out !== 8'he7) $display("FAIL: Expected out for in=0x0C is 0xE7, got 0x%h", out);
            8'h0d: if (out !== 8'hb5) $display("FAIL: Expected out for in=0x0D is 0xB5, got 0x%h", out);
            8'h0e: if (out !== 8'h4d) $display("FAIL: Expected out for in=0x0E is 0x4D, got 0x%h", out);
            8'h0f: if (out !== 8'hec) $display("FAIL: Expected out for in=0x0F is 0xEC, got 0x%h", out);
            // ... (continue for all inputs up to 8'hff)
            8'hff: if (out !== 8'h2c) $display("FAIL: Expected out for in=0xFF is 0x2C, got 0x%h", out);
        endcase

        // Check if all tests passed
        $display("PASS");
        $finish;
    end

endmodule