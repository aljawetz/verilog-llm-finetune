`timescale 1ns/1ps

module tb_mux_81;

reg D0, D1, D2, D3, D4, D5, D6, D7;
reg S0, S1, S2;
wire out;

// Instantiate the module under test
mux_81 uut (
    .out(out),
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .D4(D4),
    .D5(D5),
    .D6(D6),
    .D7(D7),
    .S0(S0),
    .S1(S1),
    .S2(S2)
);

initial begin
    // Initialize inputs
    D0 = 0; D1 = 1; D2 = 0; D3 = 1; 
    D4 = 0; D5 = 1; D6 = 0; D7 = 1;
    
    // Test all combinations of S0, S1, S2
    {S2, S1, S0} = 3'b000; #10;
    if (out !== D0) $display("FAIL: Expected %b, got %b for S=%b", D0, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b001; #10;
    if (out !== D1) $display("FAIL: Expected %b, got %b for S=%b", D1, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b010; #10;
    if (out !== D2) $display("FAIL: Expected %b, got %b for S=%b", D2, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b011; #10;
    if (out !== D3) $display("FAIL: Expected %b, got %b for S=%b", D3, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b100; #10;
    if (out !== D4) $display("FAIL: Expected %b, got %b for S=%b", D4, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b101; #10;
    if (out !== D5) $display("FAIL: Expected %b, got %b for S=%b", D5, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b110; #10;
    if (out !== D6) $display("FAIL: Expected %b, got %b for S=%b", D6, out, {S2, S1, S0});
    
    {S2, S1, S0} = 3'b111; #10;
    if (out !== D7) $display("FAIL: Expected %b, got %b for S=%b", D7, out, {S2, S1, S0});
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule