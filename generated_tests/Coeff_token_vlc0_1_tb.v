`timescale 1ns/1ps

module tb_Coeff_token_vlc0;

    reg [5:0] addr;
    wire [7:0] vlc_code;

    // Instantiate the unit under test (UUT)
    Coeff_token_vlc0 uut (
        .addr(addr),
        .vlc_code(vlc_code)
    );

    initial begin
        // Test cases
        addr = 6'd0; #10;
        if (vlc_code !== 8'h55) $display("FAIL: addr=0, expected 0x55, got 0x%h", vlc_code);

        addr = 6'd1; #10;
        if (vlc_code !== 8'h11) $display("FAIL: addr=1, expected 0x11, got 0x%h", vlc_code);

        addr = 6'd2; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=2, expected 0x00, got 0x%h", vlc_code);

        addr = 6'd3; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=3, expected 0x00, got 0x%h", vlc_code);

        addr = 6'd4; #10;
        if (vlc_code !== 8'h77) $display("FAIL: addr=4, expected 0x77, got 0x%h", vlc_code);

        addr = 6'd5; #10;
        if (vlc_code !== 8'h45) $display("FAIL: addr=5, expected 0x45, got 0x%h", vlc_code);

        addr = 6'd6; #10;
        if (vlc_code !== 8'h12) $display("FAIL: addr=6, expected 0x12, got 0x%h", vlc_code);

        addr = 6'd7; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=7, expected 0x00, got 0x%h", vlc_code);

        addr = 6'd8; #10;
        if (vlc_code !== 8'h78) $display("FAIL: addr=8, expected 0x78, got 0x%h", vlc_code);

        addr = 6'd63; #10;
        if (vlc_code !== 8'h8f) $display("FAIL: addr=63, expected 0x8f, got 0x%h", vlc_code);

        addr = 6'd64; #10; // Testing default case
        if (vlc_code !== 8'h00) $display("FAIL: addr=64, expected 0x00, got 0x%h", vlc_code);

        $display("PASS");
        $finish;
    end

endmodule