`timescale 1ns/1ps

module tb_b2g_g2b;

reg select;
reg [3:0] in;
wire [3:0] out;

// Instantiate the module under test
b2g_g2b uut (
    .select(select),
    .in(in),
    .out(out)
);

initial begin
    // Test binary to Gray code conversion
    select = 1'b1; // Set select for binary to gray
    in = 4'b0000;  // Binary 0
    #10;
    if (out !== 4'b0000) $display("FAIL: Binary to Gray conversion failed for input 0000");
    
    in = 4'b0001;  // Binary 1
    #10;
    if (out !== 4'b0001) $display("FAIL: Binary to Gray conversion failed for input 0001");
    
    in = 4'b0010;  // Binary 2
    #10;
    if (out !== 4'b0011) $display("FAIL: Binary to Gray conversion failed for input 0010");
    
    in = 4'b0011;  // Binary 3
    #10;
    if (out !== 4'b0010) $display("FAIL: Binary to Gray conversion failed for input 0011");
    
    in = 4'b0100;  // Binary 4
    #10;
    if (out !== 4'b0110) $display("FAIL: Binary to Gray conversion failed for input 0100");
    
    in = 4'b0101;  // Binary 5
    #10;
    if (out !== 4'b0111) $display("FAIL: Binary to Gray conversion failed for input 0101");
    
    in = 4'b0110;  // Binary 6
    #10;
    if (out !== 4'b0101) $display("FAIL: Binary to Gray conversion failed for input 0110");
    
    in = 4'b0111;  // Binary 7
    #10;
    if (out !== 4'b0100) $display("FAIL: Binary to Gray conversion failed for input 0111");
    
    in = 4'b1000;  // Binary 8
    #10;
    if (out !== 4'b1100) $display("FAIL: Binary to Gray conversion failed for input 1000");
    
    in = 4'b1001;  // Binary 9
    #10;
    if (out !== 4'b1101) $display("FAIL: Binary to Gray conversion failed for input 1001");
    
    in = 4'b1010;  // Binary 10
    #10;
    if (out !== 4'b1011) $display("FAIL: Binary to Gray conversion failed for input 1010");
    
    in = 4'b1011;  // Binary 11
    #10;
    if (out !== 4'b1010) $display("FAIL: Binary to Gray conversion failed for input 1011");
    
    in = 4'b1100;  // Binary 12
    #10;
    if (out !== 4'b1110) $display("FAIL: Binary to Gray conversion failed for input 1100");
    
    in = 4'b1101;  // Binary 13
    #10;
    if (out !== 4'b1111) $display("FAIL: Binary to Gray conversion failed for input 1101");
    
    in = 4'b1110;  // Binary 14
    #10;
    if (out !== 4'b1101) $display("FAIL: Binary to Gray conversion failed for input 1110");
    
    in = 4'b1111;  // Binary 15
    #10;
    if (out !== 4'b1100) $display("FAIL: Binary to Gray conversion failed for input 1111");
    
    // Test Gray to binary conversion
    select = 1'b0; // Set select for gray to binary
    in = 4'b0000;  // Gray 0
    #10;
    if (out !== 4'b0000) $display("FAIL: Gray to Binary conversion failed for input 0000");
    
    in = 4'b0001;  // Gray 1
    #10;
    if (out !== 4'b0001) $display("FAIL: Gray to Binary conversion failed for input 0001");
    
    in = 4'b0011;  // Gray 2
    #10;
    if (out !== 4'b0010) $display("FAIL: Gray to Binary conversion failed for input 0011");
    
    in = 4'b0010;  // Gray 3
    #10;
    if (out !== 4'b0011) $display("FAIL: Gray to Binary conversion failed for input 0010");
    
    in = 4'b0110;  // Gray 4
    #10;
    if (out !== 4'b0100) $display("FAIL: Gray to Binary conversion failed for input 0110");
    
    in = 4'b0111;  // Gray 5
    #10;
    if (out !== 4'b0101) $display("FAIL: Gray to Binary conversion failed for input 0111");
    
    in = 4'b0101;  // Gray 6
    #10;
    if (out !== 4'b0110) $display("FAIL: Gray to Binary conversion failed for input 0101");
    
    in = 4'b0100;  // Gray 7
    #10;
    if (out !== 4'b0111) $display("FAIL: Gray to Binary conversion failed for input 0100");
    
    in = 4'b1100;  // Gray 8
    #10;
    if (out !== 4'b1000) $display("FAIL: Gray to Binary conversion failed for input 1100");
    
    in = 4'b1101;  // Gray 9
    #10;
    if (out !== 4'b1001) $display("FAIL: Gray to Binary conversion failed for input 1101");
    
    in = 4'b1011;  // Gray 10
    #10;
    if (out !== 4'b1010) $display("FAIL: Gray to Binary conversion failed for input 1011");
    
    in = 4'b1010;  // Gray 11
    #10;
    if (out !== 4'b1011) $display("FAIL: Gray to Binary conversion failed for input 1010");
    
    in = 4'b1110;  // Gray 12
    #10;
    if (out !== 4'b1100) $display("FAIL: Gray to Binary conversion failed for input 1110");
    
    in = 4'b1111;  // Gray 13
    #10;
    if (out !== 4'b1101) $display("FAIL: Gray to Binary conversion failed for input 1111");
    
    in = 4'b1101;  // Gray 14
    #10;
    if (out !== 4'b1110) $display("FAIL: Gray to Binary conversion failed for input 1101");
    
    in = 4'b1100;  // Gray 15
    #10;
    if (out !== 4'b1111) $display("FAIL: Gray to Binary conversion failed for input 1100");

    $display("PASS");
    $finish;
end

endmodule