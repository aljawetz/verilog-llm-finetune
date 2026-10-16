`timescale 1ns/1ps

module tb_bcd_to_excess3;

    reg [3:0] bcd_input;
    wire [3:0] excess3_output;

    // Instantiate the module under test (uut)
    bcd_to_excess3 uut (
        .bcd_input(bcd_input),
        .excess3_output(excess3_output)
    );

    initial begin
        // Test cases for BCD inputs
        // Expected Excess-3 outputs
        bcd_input = 4'b0000; #10; if (excess3_output !== 4'b0011) $display("FAIL: Expected 0011 for input 0000");
        bcd_input = 4'b0001; #10; if (excess3_output !== 4'b0100) $display("FAIL: Expected 0100 for input 0001");
        bcd_input = 4'b0010; #10; if (excess3_output !== 4'b0101) $display("FAIL: Expected 0101 for input 0010");
        bcd_input = 4'b0011; #10; if (excess3_output !== 4'b0110) $display("FAIL: Expected 0110 for input 0011");
        bcd_input = 4'b0100; #10; if (excess3_output !== 4'b0111) $display("FAIL: Expected 0111 for input 0100");
        bcd_input = 4'b0101; #10; if (excess3_output !== 4'b1000) $display("FAIL: Expected 1000 for input 0101");
        bcd_input = 4'b0110; #10; if (excess3_output !== 4'b1001) $display("FAIL: Expected 1001 for input 0110");
        bcd_input = 4'b0111; #10; if (excess3_output !== 4'b1010) $display("FAIL: Expected 1010 for input 0111");
        bcd_input = 4'b1000; #10; if (excess3_output !== 4'b1011) $display("FAIL: Expected 1011 for input 1000");
        bcd_input = 4'b1001; #10; if (excess3_output !== 4'b1100) $display("FAIL: Expected 1100 for input 1001");
        
        // Test invalid BCD inputs
        bcd_input = 4'b1010; #10; if (excess3_output !== 4'b1101) $display("FAIL: Expected 1101 for input 1010");
        bcd_input = 4'b1011; #10; if (excess3_output !== 4'b1110) $display("FAIL: Expected 1110 for input 1011");
        bcd_input = 4'b1100; #10; if (excess3_output !== 4'b1111) $display("FAIL: Expected 1111 for input 1100");
        bcd_input = 4'b1101; #10; if (excess3_output !== 4'b0000) $display("FAIL: Expected 0000 for input 1101");
        bcd_input = 4'b1110; #10; if (excess3_output !== 4'b0001) $display("FAIL: Expected 0001 for input 1110");
        bcd_input = 4'b1111; #10; if (excess3_output !== 4'b0010) $display("FAIL: Expected 0010 for input 1111");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule