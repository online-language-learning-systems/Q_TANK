const { Server } = require("socket.io");

const io = new Server(3000, {
    cors: { origin: "*" }
});

console.log("QTank server running on port 3000...");

io.on("connection", (socket) => {
    console.log("Client connected:", socket.id);

    // Tạo phòng (tự tạo roomId)
    socket.on("create_room", () => {
        const roomId = Math.random().toString(36).substring(2, 7);
        socket.join(roomId);

        console.log(`Room created: ${roomId}`);

        // Gửi roomId lại cho client
        socket.emit("room_created", roomId);
    });

    // Join phòng
    socket.on("join_room", (roomId) => {
        socket.join(roomId);
        console.log(`Client ${socket.id} joined room ${roomId}`);
        socket.emit("room_joined", roomId);
    });
});
