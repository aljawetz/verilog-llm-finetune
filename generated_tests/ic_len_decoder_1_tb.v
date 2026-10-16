`timescale 1ns/1ps

module tb_ic_len_decoder;

reg [7:0] opcode;
wire [3:0] len;

// Instantiate the unit under test (uut)
ic_len_decoder uut (
    .opcode(opcode),
    .len(len)
);

initial begin
    // Test cases
    // Test for length 2
    opcode = 8'h00; #10; if (len !== 4'b0010) $display("FAIL: Expected len=2 for opcode=0x00");
    opcode = 8'h1a; #10; if (len !== 4'b0010) $display("FAIL: Expected len=2 for opcode=0x1A");
    opcode = 8'hec; #10; if (len !== 4'b0010) $display("FAIL: Expected len=2 for opcode=0xEC");

    // Test for length 4
    opcode = 8'h10; #10; if (len !== 4'b0100) $display("FAIL: Expected len=4 for opcode=0x10");
    opcode = 8'hbc; #10; if (len !== 4'b0100) $display("FAIL: Expected len=4 for opcode=0xBC");
    opcode = 8'hef; #10; if (len !== 4'b0100) $display("FAIL: Expected len=4 for opcode=0xEF");

    // Test for length 8
    opcode = 8'h11; #10; if (len !== 4'b1000) $display("FAIL: Expected len=8 for opcode=0x11");
    opcode = 8'hf5; #10; if (len !== 4'b1000) $display("FAIL: Expected len=8 for opcode=0xF5");

    // Test for default length 1
    opcode = 8'hff; #10; if (len !== 4'b0001) $display("FAIL: Expected len=1 for opcode=0xFF");
    opcode = 8'h7e; #10; if (len !== 4'b0001) $display("FAIL: Expected len=1 for opcode=0x7E");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule