`timescale 1ns/1ps

module tb_decoder3x8;

reg [2:0] d;
wire [7:0] y;

// Instantiate the module under test (uut)
decoder3x8 uut (
    .d(d),
    .y(y)
);

initial begin
    // Initialize inputs
    d = 3'b000;

    // Test all possible inputs
    #10 d = 3'b000; #10 check_output(8'b00000001);
    #10 d = 3'b001; #10 check_output(8'b00000010);
    #10 d = 3'b010; #10 check_output(8'b00000100);
    #10 d = 3'b011; #10 check_output(8'b00001000);
    #10 d = 3'b100; #10 check_output(8'b00010000);
    #10 d = 3'b101; #10 check_output(8'b00100000);
    #10 d = 3'b110; #10 check_output(8'b01000000);
    #10 d = 3'b111; #10 check_output(8'b10000000);

    // Finish simulation
    $display("PASS");
    $finish;
end

task check_output(input [7:0] expected);
    if (y !== expected) begin
        $display("FAIL: Expected %b but got %b for input %b", expected, y, d);
        $finish;
    end
endtask

endmodule