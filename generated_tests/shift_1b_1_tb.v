`timescale 1ns/1ps

module tb_shift_1b;

reg i_shift;
reg [31:0] i_data;
wire [31:0] o_data;

// Instantiate the module under test (uut)
shift_1b uut (
    .i_shift(i_shift),
    .i_data(i_data),
    .o_data(o_data)
);

initial begin
    // Test case 1: i_shift = 0, expect o_data = i_data
    i_shift = 0;
    i_data = 32'hA5A5A5A5; // Example data
    #10;
    if (o_data !== i_data) begin
        $display("FAIL: Test case 1 failed, expected %h but got %h", i_data, o_data);
        $finish;
    end

    // Test case 2: i_shift = 1, expect o_data = i_data shifted left by 1 bit
    i_shift = 1;
    i_data = 32'hA5A5A5A5; // Example data
    #10;
    if (o_data !== {i_data[30:0], 1'b0}) begin
        $display("FAIL: Test case 2 failed, expected %h but got %h", {i_data[30:0], 1'b0}, o_data);
        $finish;
    end

    // Test case 3: i_shift = 1, expect o_data = 0 when i_data is 0
    i_shift = 1;
    i_data = 32'h00000000; // Example data
    #10;
    if (o_data !== 32'h00000000) begin
        $display("FAIL: Test case 3 failed, expected 0 but got %h", o_data);
        $finish;
    end

    // Test case 4: i_shift = 0, expect o_data = i_data when i_data is 0
    i_shift = 0;
    i_data = 32'h00000000; // Example data
    #10;
    if (o_data !== i_data) begin
        $display("FAIL: Test case 4 failed, expected %h but got %h", i_data, o_data);
        $finish;
    end

    // Test case 5: i_shift = 1, expect o_data = 0 when i_data is 1
    i_shift = 1;
    i_data = 32'h00000001; // Example data
    #10;
    if (o_data !== 32'h00000002) begin
        $display("FAIL: Test case 5 failed, expected %h but got %h", 32'h00000002, o_data);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule