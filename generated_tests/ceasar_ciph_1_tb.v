`timescale 1ns/1ps

module tb_ceasar_ciph;

reg [7:0] pt;
reg [4:0] key;
wire [7:0] ct;

// Instantiate the module under test (uut)
ceasar_ciph uut (
    .pt(pt),
    .ct(ct),
    .key(key)
);

initial begin
    // Test case 1: Lowercase 'a' with key 1
    pt = 8'd97; // 'a'
    key = 5'd1;
    #10;
    if (ct !== 8'd66) $display("FAIL: Expected 66 for input 'a' with key 1, got %d", ct);

    // Test case 2: Lowercase 'z' with key 1
    pt = 8'd122; // 'z'
    key = 5'd1;
    #10;
    if (ct !== 8'd90) $display("FAIL: Expected 90 for input 'z' with key 1, got %d", ct);

    // Test case 3: Lowercase 'm' with key 5
    pt = 8'd109; // 'm'
    key = 5'd5;
    #10;
    if (ct !== 8'd84) $display("FAIL: Expected 84 for input 'm' with key 5, got %d", ct);

    // Test case 4: Non-lowercase input (uppercase 'A')
    pt = 8'd65; // 'A'
    key = 5'd3;
    #10;
    if (ct !== 8'bX) $display("FAIL: Expected undefined for input 'A', got %d", ct);

    // Test case 5: Non-lowercase input (non-alphabetic character)
    pt = 8'd50; // '2'
    key = 5'd3;
    #10;
    if (ct !== 8'bX) $display("FAIL: Expected undefined for input '2', got %d", ct);

    // Test case 6: Lowercase 'x' with key 3
    pt = 8'd120; // 'x'
    key = 5'd3;
    #10;
    if (ct !== 8'd90) $display("FAIL: Expected 90 for input 'x' with key 3, got %d", ct);

    // Test case 7: Lowercase 'y' with key 5
    pt = 8'd121; // 'y'
    key = 5'd5;
    #10;
    if (ct !== 8'd96) $display("FAIL: Expected 96 for input 'y' with key 5, got %d", ct);

    // Test case 8: Lowercase 'b' with key 0
    pt = 8'd98; // 'b'
    key = 5'd0;
    #10;
    if (ct !== 8'd66) $display("FAIL: Expected 66 for input 'b' with key 0, got %d", ct);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule