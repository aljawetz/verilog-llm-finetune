`timescale 1ns/1ps

module tb_mux;

reg a;
reg b;
reg sel;
wire y;

// Instantiate the module under test (uut)
mux uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin
    // Test case 1: sel = 0, expect y = a
    a = 1; b = 0; sel = 0;
    #10;
    if (y !== a) begin
        $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
        $finish;
    end

    // Test case 2: sel = 1, expect y = b
    a = 0; b = 1; sel = 1;
    #10;
    if (y !== b) begin
        $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);
        $finish;
    end

    // Test case 3: sel = 0, expect y = a
    a = 1; b = 1; sel = 0;
    #10;
    if (y !== a) begin
        $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a, y);
        $finish;
    end

    // Test case 4: sel = 1, expect y = b
    a = 0; b = 0; sel = 1;
    #10;
    if (y !== b) begin
        $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);
        $finish;
    end

    // Test case 5: sel = 0, expect y = a
    a = 1; b = 0; sel = 0;
    #10;
    if (y !== a) begin
        $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", a, y);
        $finish;
    end

    // Test case 6: sel = 1, expect y = b
    a = 0; b = 1; sel = 1;
    #10;
    if (y !== b) begin
        $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", b, y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule