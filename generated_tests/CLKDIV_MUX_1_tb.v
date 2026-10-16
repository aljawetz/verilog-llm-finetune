`timescale 1ns/1ps

module tb_CLKDIV_MUX;

reg [5:0] prescale;
wire [5:0] Div_Ratio;

// Instantiate the module under test
CLKDIV_MUX uut (
    .prescale(prescale),
    .Div_Ratio(Div_Ratio)
);

initial begin
    // Test case 1: prescale = 6'b001000
    prescale = 6'b001000;
    #10;
    if (Div_Ratio !== 6'b100) begin
        $display("FAIL: Expected Div_Ratio = 6'b100 for prescale = 6'b001000, got %b", Div_Ratio);
        $finish;
    end

    // Test case 2: prescale = 6'b010000
    prescale = 6'b010000;
    #10;
    if (Div_Ratio !== 6'b010) begin
        $display("FAIL: Expected Div_Ratio = 6'b010 for prescale = 6'b010000, got %b", Div_Ratio);
        $finish;
    end

    // Test case 3: prescale = 6'b100000
    prescale = 6'b100000;
    #10;
    if (Div_Ratio !== 6'b001) begin
        $display("FAIL: Expected Div_Ratio = 6'b001 for prescale = 6'b100000, got %b", Div_Ratio);
        $finish;
    end

    // Test case 4: prescale = 6'b000000 (default case)
    prescale = 6'b000000;
    #10;
    if (Div_Ratio !== 6'b001) begin
        $display("FAIL: Expected Div_Ratio = 6'b001 for prescale = 6'b000000, got %b", Div_Ratio);
        $finish;
    end

    // Test case 5: prescale = 6'b111111 (default case)
    prescale = 6'b111111;
    #10;
    if (Div_Ratio !== 6'b001) begin
        $display("FAIL: Expected Div_Ratio = 6'b001 for prescale = 6'b111111, got %b", Div_Ratio);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule