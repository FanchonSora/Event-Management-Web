import { Server } from 'socket.io';

const io = new Server();

io.on('connection', (socket) => {
    console.log('a user connected');
    socket.on('disconnect', () => {
        console.log('user disconnected');
    });

    socket.on('greet', (data) => {
        console.log(data);
        socket.emit('greet', 'Hello, client!');
        io.emit('greet', "Hello, everyone!" + data);
    });

    socket.on('positionUpdate', (data) => {
        console.log(data);
        io.emit('positionUpdate', data);
    });
});

export default io;